Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EE8696871
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 16:48:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRxWk-00046a-2L; Tue, 14 Feb 2023 10:47:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRxWe-00045b-07
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 10:47:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRxWc-0003Lg-Gt
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 10:47:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676389641;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=2urHVZqRZZDidq5JEdF+J+lTVlTrPmud88WyeCd9IIE=;
 b=XU60w1tnLBs3ImuNWGaWY1OkWoAb58C/xMqLHFsGatwbUNFmb7ZUPaAiqMk6iLt4wHudK/
 gg756NCuaah/POqXP5/bpaIaaoQryWhl5vAnmw8n6ELficy5cHG3Df2AVtUe5f3hjUOZmM
 nR/wA9bnGLtxkRIdS+aaaxPl0ZXti7Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-509-Y82jRgEUMuinck35Pa7rWg-1; Tue, 14 Feb 2023 10:47:19 -0500
X-MC-Unique: Y82jRgEUMuinck35Pa7rWg-1
Received: by mail-wm1-f71.google.com with SMTP id
 r14-20020a05600c35ce00b003e10bfcd160so8855216wmq.6
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 07:47:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2urHVZqRZZDidq5JEdF+J+lTVlTrPmud88WyeCd9IIE=;
 b=lJIxqWDnu3Zo2fp7qTKUn9OWJw42pzw9vY3sDTjvSrHDIR8zBMncZa77ALsh6qivqJ
 av0KVGajHMDLINFJwrxVGY+hIys+QQGaKW3Z/ygNrSBc78qtZ3z71P0MuXGHVDcOnhV+
 MrkXZSiCxBS4vVCj+3WMurxVcBYmKESwJzQKdkvWJy9R9batr5y9R6cbnO0HlvanDU+i
 /L4tD/dY9hzXDwxg2f99PRCkN3KwKL24bgvqmeJwP2Qx/qbxpTH8RaLHMTJLcq0D4bmf
 fp08vgdtJRRzLroli8/pqjHqPKk/UK2/Vz4eTmPXHHX3AtgR6wuTKKnfSFXUnM2BMSYx
 8Crg==
X-Gm-Message-State: AO0yUKUPj0SfjvQgh3rqeytRn0ErwkRBVGAXLFRZMlv00Z/dB7i2I4UE
 U+MBBmVHPUddp75PJB0xGpN0087jkgoNKm7Csl/nXqU8/kK7Mw7JharFne6F6BETYA24N0U4Alg
 tWgVIK+Oyf0KtQP0=
X-Received: by 2002:adf:f64e:0:b0:2bf:cb6a:a7e with SMTP id
 x14-20020adff64e000000b002bfcb6a0a7emr2464392wrp.42.1676389638563; 
 Tue, 14 Feb 2023 07:47:18 -0800 (PST)
X-Google-Smtp-Source: AK7set8saFIs8/Lum+u6WCvQ9zGd1jYprWQRkl6J1oL+2EPSMYbwDAIgaRnA/Hip5vpvl9XO/evMUg==
X-Received: by 2002:adf:f64e:0:b0:2bf:cb6a:a7e with SMTP id
 x14-20020adff64e000000b002bfcb6a0a7emr2464379wrp.42.1676389638330; 
 Tue, 14 Feb 2023 07:47:18 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 w1-20020a5d4b41000000b002c54c0a5aa9sm10536130wrs.74.2023.02.14.07.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 07:47:17 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-block@nongnu.org,  Alex Williamson <alex.williamson@redhat.com>,
 Fam Zheng <fam@euphon.net>,  Eric Blake <eblake@redhat.com>,  "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>,  Stefan Hajnoczi
 <stefanha@redhat.com>,  Halil Pasic <pasic@linux.ibm.com>,  David
 Hildenbrand <david@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Eric
 Farman <farman@linux.ibm.com>,  qemu-s390x@nongnu.org,  John Snow
 <jsnow@redhat.com>,  Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 1/3] migration: In case of postcopy, the memory ends in
 res_postcopy_only
In-Reply-To: <3a3f4598-e7fc-0f22-51f9-029ce372af14@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Tue, 14 Feb 2023 18:04:04 +0300")
References: <20230208135719.17864-1-quintela@redhat.com>
 <20230208135719.17864-2-quintela@redhat.com>
 <61c84841-7018-edb2-806b-921e2065f940@yandex-team.ru>
 <87mt5m3e2d.fsf@secure.mitica>
 <3a3f4598-e7fc-0f22-51f9-029ce372af14@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 14 Feb 2023 16:47:16 +0100
Message-ID: <87y1p01c6z.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
> On 09.02.23 21:10, Juan Quintela wrote:
>> Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
>>> On 08.02.23 16:57, Juan Quintela wrote:
>>>> So remove last assignation of res_compatible.
>> 
>
>
> I think, that the order of logic and documentation changing since introducing _estimate is a bit confused.
>
> But I agree now, that we are safe to unite old compat and old postcopy_only into one variable, as we want only
>
> 1. the total sum, to probably go to migration_completion()
> 2. pend_pre to probably go to postcopy_start()
>
> So, patch is OK, and seems it changes absolutely nothing in logic. Thanks for explanations!
>
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Thanks.

You are welcome.


