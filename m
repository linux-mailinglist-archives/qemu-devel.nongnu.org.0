Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AB25B6B8D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 12:24:10 +0200 (CEST)
Received: from localhost ([::1]:41582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY35N-0003ey-0N
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 06:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oY2yS-0000wO-KG
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:17:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oY2yQ-0003cC-OG
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:17:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663064217;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type; bh=inVe8dJWP7LKJfU9nqCSt710wfXhHJdu+160e8XyDjw=;
 b=EvpLu4uS5a82yE6ndo/xAQtf1Q7FkVb/uUY40Cws093XvqGbjEO/2ftagLbCNLLH21AVDm
 C/od/yzOzTQMNlRIuatLz1LOFqsrZ8MHM3SKzztoTFINHBRbDP7MKOtwQKFrBSBlnDsC1y
 Y5tHkh/4cUkS7S9RAiH1mD/ttvlbuJY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-437-RijQZrs8Pn6fddsNtMLfqw-1; Tue, 13 Sep 2022 06:16:56 -0400
X-MC-Unique: RijQZrs8Pn6fddsNtMLfqw-1
Received: by mail-wm1-f72.google.com with SMTP id
 203-20020a1c02d4000000b003b499f99aceso146184wmc.1
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 03:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:subject:to:from
 :x-gm-message-state:from:to:cc:subject:date;
 bh=inVe8dJWP7LKJfU9nqCSt710wfXhHJdu+160e8XyDjw=;
 b=fu4QqojF3/K+Hu4RVbWjHSaHgqTiOKG7UtdXVNVqJ9Ydfy8AQwH2VNQoYq/XM0lMMT
 a/k/sylEnzwQ84IkoW1DYSWUHbyZg23+sg/tnFqzmLaTxPGiQLBVBmijBJV1mfVZvrhh
 OUmHZNitvy3hI9AtNPLV/h93MrXvytESNHPxQqxjPE/AwvHBFAJGBMsgPSVG1qwXsTQg
 8DMvo8mLuZ7JsB2YhFv8V2Kc4SW6McqIEoIQ+xd6jAmfIR9NiIFn+M3eoNjz/SMjLFqF
 gTTKi9bRSyq3khXXMACVFbgMMf3TmwyYAtGUBodSYSgw15sWQwRaehbk67Jt3dZ7WrEq
 nhtg==
X-Gm-Message-State: ACgBeo0D3/LhKTr8GcY6fhs4oae/BdsEtQnEZsdN6hhHEQy+8f4Jqw2Y
 RSYS/5GaB2k+WzD0v4DYl32fdMek6licaDsvC63apnSz913ItwwkeaquUw+CehViOnNKVH/9h1K
 naiz6MQfy/h4s4NE=
X-Received: by 2002:a05:6000:2ce:b0:226:d420:db7a with SMTP id
 o14-20020a05600002ce00b00226d420db7amr16951089wry.489.1663064214825; 
 Tue, 13 Sep 2022 03:16:54 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5ENAUQ3Vwt5Y5a4zvjhTouitO7g55T2X93uJd8GKG5xTH8WvYCWVmtq8lfIyaozYJxbnUZPg==
X-Received: by 2002:a05:6000:2ce:b0:226:d420:db7a with SMTP id
 o14-20020a05600002ce00b00226d420db7amr16951080wry.489.1663064214618; 
 Tue, 13 Sep 2022 03:16:54 -0700 (PDT)
Received: from localhost ([89.101.193.72]) by smtp.gmail.com with ESMTPSA id
 bw2-20020a0560001f8200b00228c483128dsm7402536wrb.90.2022.09.13.03.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 03:16:54 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: kvm-devel <kvm@vger.kernel.org>, qemu-devel@nongnu.org
Subject: KVM call for 2022-09-20
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Tue, 13 Sep 2022 12:16:52 +0200
Message-ID: <87illrpoiz.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Hi

Please, send any topic that you are interested in covering.

At the end of Monday I will send an email with the agenda or the
cancellation of the call, so hurry up.

After discussions on the QEMU Summit, we are going to have always open a
KVM call where you can add topics.

 Call details:

By popular demand, a google calendar public entry with it

https://calendar.google.com/calendar/u/0/r/eventedit/copy/NWR0NWppODdqNXFyYzAwbzYza3RxN2dob3VfMjAyMjA5MjBUMTMwMDAwWiBlZ2VkN2NraTA1bG11MXRuZ3ZrbDN0aGlkc0Bn/anVhbi5xdWludGVsYUBnbWFpbC5jb20?scp=ALL&sf=true

(Let me know if you have any problems with the calendar entry.  I just
gave up about getting right at the same time CEST, CET, EDT and DST).

If you need phone number details,  contact me privately

Thanks, Juan.


