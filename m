Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D52325FD50D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 08:43:46 +0200 (CEST)
Received: from localhost ([::1]:59144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oirwW-0007Vw-Q7
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 02:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oirmV-0001Hj-Qb
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:33:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oirmQ-0003l4-4E
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:33:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665642797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t1bbncJpkZyBiz/g9qNnQdVPBbDGenrTmaSHWTye9v4=;
 b=PRrCkI0qjUBhUdk+gE73GXzp4frJfNWq9C00qwmS3f88PlsoCtR943ScxYeh74mU1tk5U+
 VgCGBr6VWzaB3sI012Q+0Xgumu/BnnKgLBJDi1v5TyFLbU4CRj3e8Jfflpl6yWhm6X+W9U
 3Rygrod0rEaOnAvrO2cXEw0CUOM3bbY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-dA8x_m84PuOUii0dqpvvQw-1; Thu, 13 Oct 2022 02:33:15 -0400
X-MC-Unique: dA8x_m84PuOUii0dqpvvQw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D9083C01D84;
 Thu, 13 Oct 2022 06:33:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F146C2086F7A;
 Thu, 13 Oct 2022 06:33:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E2C9A21E691D; Thu, 13 Oct 2022 08:33:13 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org,  Nikita Ivanov <nivanov@cloudlinux.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Greg Kurz <groug@kaod.org>,  Jason Wang
 <jasowang@redhat.com>,  Michael Roth <michael.roth@amd.com>,  Konstantin
 Kostiuk <kkostiuk@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 1/2] Refactoring: refactor TFR() macro to
 RETRY_ON_EINTR()
References: <CAAJ4Ao-4+a4UtWKf0XyrQ6kQD8EsyDbn3H5O=R2DdzP76VSdZQ@mail.gmail.com>
 <3046525.4nXOIBtuzV@silver>
Date: Thu, 13 Oct 2022 08:33:13 +0200
In-Reply-To: <3046525.4nXOIBtuzV@silver> (Christian Schoenebeck's message of
 "Wed, 12 Oct 2022 18:08:39 +0200")
Message-ID: <87a6601bdi.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Christian Schoenebeck <qemu_oss@crudebyte.com> writes:

> On Mittwoch, 12. Oktober 2022 14:28:23 CEST Nikita Ivanov wrote:
>> Rename macro name to more transparent one and refactor
>> it to expression.
>> 
>> Signed-off-by: Nikita Ivanov <nivanov@cloudlinux.com>

[...]

>> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
>> index b1c161c035..a470905475 100644
>> --- a/include/qemu/osdep.h
>> +++ b/include/qemu/osdep.h
>> @@ -243,7 +243,13 @@ void QEMU_ERROR("code path is reachable")
>>  #define ESHUTDOWN 4099
>>  #endif
>> 
>> -#define TFR(expr) do { if ((expr) != -1) break; } while (errno == EINTR)
>> +#define RETRY_ON_EINTR(expr) \
>> +    (__extension__                                          \
>> +        ({ typeof(expr) __result;                               \
>> +           do {                                             \
>> +                __result = (typeof(expr)) (expr);         \
>
> Not a big deal, but as Peter already pointed out in previous version: you 
> could drop the type cast in this particular form here.

Yes, please.

> glibc's TEMP_FAILURE_RETRY() version needs the cast as it uses `long int` as 
> hard coded type for the result variable, whereas this version here uses a 
> generic approach by declaring the result variable already exactly with the 
> type the passed expression evaluates to, so the cast is redundant in this 
> version here.
>
>> +           } while (__result == -1L && errno == EINTR);     \
>> +           __result; }))
>> 
>>  /* time_t may be either 32 or 64 bits depending on the host OS, and
>>   * can be either signed or unsigned, so we can't just hardcode a

[...]


