Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BAF6A5863
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 12:35:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWyGX-0004dg-9u; Tue, 28 Feb 2023 06:35:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pWyGH-0004bA-LO
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:35:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pWyGC-0005BY-D3
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:35:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677584107;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=HftfkPZwTyT3XFfum7fmkIyVRNwAmrXomunj3xf/y5I=;
 b=Cgt9bnNoC6Smd/uUZhcYo7sa5+rtbAU7i8MRONGfpiY64gE2Onten0ihL9I8X8DUZV3D1Y
 fKuug59EdVhTDt4HI1Fh/9hpeA5LFcWnqAjAiwghmSIjmctiIfMQyewIhU+0iLlFU9Ofhe
 yJ34aHrNai81uB/K450PQK8ErSKpiUw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-438-J9vFjN_DPdyLnZBO2iYyBw-1; Tue, 28 Feb 2023 06:35:06 -0500
X-MC-Unique: J9vFjN_DPdyLnZBO2iYyBw-1
Received: by mail-wm1-f70.google.com with SMTP id
 l23-20020a7bc457000000b003e206cbce8dso3512168wmi.7
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 03:35:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HftfkPZwTyT3XFfum7fmkIyVRNwAmrXomunj3xf/y5I=;
 b=tXainwhZx7H7pQC17khORxOGyM5J6lHPfWD+y+LIi4GVo3aTDMlinVxlep6hlmcS6z
 R8PB0stT4QU0PszP11IWtvkOUFuv8MJRC2A3mrXUaZOEOkNPbtQXczMAwEXgQUBfpk+0
 qxjQA4H9VnWKAz1VuLfg3gF5iYgF8wjiRuu0Jmg9fbFi4u2HRTdhvkh49fR9gHPN/M6q
 roQqVdqhNX2qVwrsd+/IBeMuqz2+o9CjNYImV7KvGr+nqwi2s2v/zyBmNoc/hlVsP5BV
 UbRixSN9R7SiS+/OtbHql4r6Yx7EoQUrPcJYfGL2HehM5ABBgRstbE1KBxZKQvU6ZZFc
 JbdQ==
X-Gm-Message-State: AO0yUKWTMbkMBrHNEy++Ym8DyWloGG6mDogWi91FhffMZXqnsuQlWf1w
 j8Fg0UD1Qh9xfgzeJVbkt/q5uk9XDMPi2uN0TgdbXZi0vGoEgrKIM0E5bejVW4juLxvbF/mUvOr
 SiSoLYkkUTTgbC4U=
X-Received: by 2002:a05:6000:1845:b0:2c7:d7c:7d0 with SMTP id
 c5-20020a056000184500b002c70d7c07d0mr10509219wri.22.1677584105093; 
 Tue, 28 Feb 2023 03:35:05 -0800 (PST)
X-Google-Smtp-Source: AK7set/evOCnFqPU93NZp02q/CvAW0ugw0WeNsBjIWB/6wDxSKQo+XvLtR8/A9vhTishCInttKbzRQ==
X-Received: by 2002:a05:6000:1845:b0:2c7:d7c:7d0 with SMTP id
 c5-20020a056000184500b002c70d7c07d0mr10509202wri.22.1677584104775; 
 Tue, 28 Feb 2023 03:35:04 -0800 (PST)
Received: from redhat.com (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a05600c4f1400b003e20cf0408esm13124463wmq.40.2023.02.28.03.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 03:35:04 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "John Berberian, Jr" <jeb.study@gmail.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,  Stefan
 Weil <sw@weilnetz.de>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
 qemu-devel@nongnu.org,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2] Fix exec migration on Windows (w32+w64).
In-Reply-To: <87pm9ukpti.fsf@secure.mitica> (Juan Quintela's message of "Tue, 
 28 Feb 2023 12:11:05 +0100")
References: <20230116013421.3149183-1-jeb.study@gmail.com>
 <CAJ+F1C+x3tSHAb6LbL+GK0m08UuKCS0RWygz41gMFycqL0JrrQ@mail.gmail.com>
 <Y8UXR6uqdv22auoE@redhat.com>
 <db09ab65-a6a7-0096-625a-c323a4b5aacf@gmail.com>
 <CAJ+F1CKkqcgCYfnGVK7LSD5gE1ueX2HrCGqP26_UJZYt3E-q4A@mail.gmail.com>
 <12107bdf-f631-e42a-5136-59bb67e301fc@gmail.com>
 <87pm9ukpti.fsf@secure.mitica>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 28 Feb 2023 12:35:02 +0100
Message-ID: <87lekikopl.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

Juan Quintela <quintela@redhat.com> wrote:
> "John Berberian, Jr" <jeb.study@gmail.com> wrote:
>> ping. Is there anything I can do to help this get merged?
>
> Hi
>
> I have to get back from Marc/Daniel before proceed.
>
> You did an answer, but they didn't respond.
>
> What should we do here?
>
> Thanks, Juan.

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.

Althought I would have preffer to create a

os_get_cmd_path()

in both os-win32.c and os-posix.c, so we don't have the #ifdefs at all.

If you consider doing that, let me know and I will drop this one.

Later, Juan.


