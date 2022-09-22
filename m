Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1235E6933
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 19:09:25 +0200 (CEST)
Received: from localhost ([::1]:49250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obPhV-0004Nf-2n
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 13:09:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obO7E-00081S-IZ
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:27:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obO7D-00038a-1m
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:27:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663860470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mrCP19LB4SryCR63MOFI8bydcwc9GeCZfEg3tdi5P8s=;
 b=h5Ac6vBIA4NKhtJT6nm8n1o+0woqBdlM/Csg5W0EI4RD6mpC3bHe0/SDmJt0ohxDVy+g7c
 JVXOZsDv6JEfNy7eZrLuQKyktRaU/JfV5t0ypRi7IOjCUE2hcIYDdu773Dh16cr8TwLxBr
 gJwK/mjzDJ/Ctx1OUU7nQio2cWAfKWw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-uXlFpvs7MT-uAtI7S9GFxw-1; Thu, 22 Sep 2022 11:27:46 -0400
X-MC-Unique: uXlFpvs7MT-uAtI7S9GFxw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B525872844;
 Thu, 22 Sep 2022 15:27:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4540D492B1B;
 Thu, 22 Sep 2022 15:27:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5368E21E6900; Thu, 22 Sep 2022 17:27:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,  Paolo Bonzini <pbonzini@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  qemu-devel@nongnu.org,
 dinechin@redhat.com,  Gerd Hoffmann <kraxel@redhat.com>,  =?utf-8?Q?Marc?=
 =?utf-8?Q?-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v4 2/3] module: add Error arguments to module_load_one
 and module_load_qom_one
References: <20220908183012.17667-3-cfontana@suse.de>
 <877d23ekj0.fsf@pond.sub.org>
 <76775f64-e49a-1c3c-0d73-10d93eff34e4@amsat.org>
 <87y1ucdirx.fsf@pond.sub.org>
 <cc2c5e14-f0a0-4415-9fe1-d7811ee27850@suse.de>
 <878rmc54cw.fsf@pond.sub.org> <Yywcs7CpKDxahOSM@redhat.com>
 <87leqb4ul9.fsf@pond.sub.org>
 <5f5921fe-6d4f-490b-4328-702a45973bbc@suse.de>
 <87bkr7mvgr.fsf@pond.sub.org> <Yyx3Pc89tbqBliM0@redhat.com>
Date: Thu, 22 Sep 2022 17:27:43 +0200
In-Reply-To: <Yyx3Pc89tbqBliM0@redhat.com> (Kevin Wolf's message of "Thu, 22
 Sep 2022 16:54:53 +0200")
Message-ID: <87wn9vig40.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Kevin Wolf <kwolf@redhat.com> writes:

> Am 22.09.2022 um 14:42 hat Markus Armbruster geschrieben:

[...]

>> If you have callers that need to distinguish between not found, found
>> but bad, found and good, then return three distinct values.
>> 
>> I proposed to return -1 for found but bad (error), 0 for not found (no
>> error), and 1 for loaded (no error).
>
> My intuition with this one was that "not found" is still an error case,
> but it's an error case that we need to distinguish from other error
> cases.
>
> Is this one of the rare use cases for error classes?

If I remember correctly, "not found" is not actually an error for most
callers.  If we make it one, these callers have to error_free().  Minor
annoyance, especially when you have to add an else just for that.

Even if we decide to make it an error, I would not create an error class
for it.  I like

    rc = module_load_one(..., errp);
    if (rc == -ENOENT) {
        error_free(*errp);
    } else if (rc < 0) {
        return;
    }

better than

    Error *err = NULL;

    module_load_one(..., &err);
    if (err && err->class == ERROR_CLASS_NOT_FOUND) {
        error_free(err);
    } else if (err) {
        error_propagate(errp, err);
        return;
    }

I respect your intuition.  Would it still say "error case" when the
function is called module_load_if_exists()?

Hmm, another thought... a need to distinguish error cases can be a
symptom of trying to do too much in one function.  We could split this
into "look up module" and "actually load it".


