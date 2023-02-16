Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB6E699267
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 11:57:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSbwK-0004lU-Vj; Thu, 16 Feb 2023 05:56:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSbwI-0004fl-KZ
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 05:56:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSbwH-0002bR-0q
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 05:56:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676544992;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T3U9QORg0lMd3ZC9KFcgulk0hNSFicEtxMcrNkm32BI=;
 b=MPQDxKA8zIut/lzsEfhuJKgg8tt9ARSq+bwe8llLr4VAVAnaClwXh2Jy+7NhjSMtrRiL4f
 L2l23Nvyyj/ZlHRGI8ytAQcbZo2JV++Q67JzF184lDXy5ZeiOVohfJXSlX7Xh2Iz1dAAop
 65TWg9wdbjFihMge9bRm9aWl4mrUPFg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-121-2x2UChKiM3uoZHJSpctECQ-1; Thu, 16 Feb 2023 05:56:30 -0500
X-MC-Unique: 2x2UChKiM3uoZHJSpctECQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 p14-20020a05600c468e00b003e0107732f4so680051wmo.1
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 02:56:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T3U9QORg0lMd3ZC9KFcgulk0hNSFicEtxMcrNkm32BI=;
 b=aaUbW36bMroyZ0WTwM/UzvAAIYVEcO5nnS+ojJT1GM/FOvySJUAP0vrc0ucAM0Ht4G
 S00ftY6+55ynzSwCU5uH8cd7vzCgVf824Fh4AiiJGwj0FKKQrslI3K0S1hk8NlIQyrKk
 qv6ZSLGvmriZ6BmCdhQuDKqTK4YanSbWcRpu9wWRNa8vVhd1yBCZ1saRU2iwLVpFE1it
 Bq6VyLm5Ws6Qm8rU20k7cvR285YkJ8uJPUrb3ZdMuI9Du53FleLUjw+SDq9s7Frk7Zgo
 g/VzW5gRdGaNoDvtQRM0XFpH0+49v8pAma0Etz2Ks1pJXbva0aGBS9RNxqyCbnjcM5ef
 eU1Q==
X-Gm-Message-State: AO0yUKXHb9Qz7cuq6I+j4GgH/3FyFdIZadjMYB4Qk1U2Ny0V54tgAKSk
 +za1pDhAxHb5RJ/dIOtfnsAlXYDvryTAd8TBq4GevFaHkb6o7GI2Qr7XS9MAHyVBW5cjQlQOyRM
 Mn+IIRG1aP+A4P8w=
X-Received: by 2002:adf:e451:0:b0:2c5:4c0e:3736 with SMTP id
 t17-20020adfe451000000b002c54c0e3736mr4576266wrm.24.1676544989690; 
 Thu, 16 Feb 2023 02:56:29 -0800 (PST)
X-Google-Smtp-Source: AK7set/s1kQ5/nTGSeeqbDHy+KXBxzku9V02rWwVSa3oPfOlRK7tu8CFgXaDNMxPoRZGeqhs2jA40A==
X-Received: by 2002:adf:e451:0:b0:2c5:4c0e:3736 with SMTP id
 t17-20020adfe451000000b002c54c0e3736mr4576254wrm.24.1676544989358; 
 Thu, 16 Feb 2023 02:56:29 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 h17-20020a056000001100b002c54c8e70b1sm1203774wrx.9.2023.02.16.02.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 02:56:28 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>,  "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>,  Richard Henderson
 <richard.henderson@linaro.org>,  Mark Burton <mburton@qti.qualcomm.com>,
 Bill Mills <bill.mills@linaro.org>,  Marco Liebel
 <mliebel@qti.qualcomm.com>,  Alexandre Iooss <erdnaxe@crans.org>,  Mahmoud
 Mandour <ma.mandourr@gmail.com>,  Emilio Cota <cota@braap.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, "Wei W. Wang"
 <wei.w.wang@intel.com>
Subject: Re: Future of icount discussion for next KVM call?
In-Reply-To: <CAHDbmO3QSbpKLWKt9uj+2Yo_fT-dC-E4M1Nb=iWHqMSBw35-3w@mail.gmail.com>
 ("Alex =?utf-8?Q?Benn=C3=A9e=22's?= message of "Thu, 16 Feb 2023 10:23:58
 +0000")
References: <87bklt9alc.fsf@linaro.org>
 <CAHDbmO3QSbpKLWKt9uj+2Yo_fT-dC-E4M1Nb=iWHqMSBw35-3w@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 16 Feb 2023 11:56:27 +0100
Message-ID: <87lekxkhes.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> (replying all because qemu-devel rejected my email again)
>
> On Thu, 16 Feb 2023 at 10:19, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>> Hi Juan,
>>
>> Do we have an agenda for next weeks KVM call yet? If there is space I'd
>> like to take some time to discuss the future direction of icount.

For next week we have:
- more single binary qemu (philippe?)
- TDX migration from intel.
  We asked them on the previous call to change their design to transfer
  stuff through migration channels and not create a new channel.  But I
  haven't heard from intel. (wei?)
  They agreed to send the slides and post the code before continue
  discussion.

And now I like the title of you topic

- Future Direction of icount

O:-)

So, I will recommend 20 minutes each if Wei shows up, or 30/30 for the
rest.

What do the rest of the people think.

>> Specifically I believe there might be some proposals for how we could
>> support icount with MTTCG worth discussing. From my point of view icount
>> provides too things:
>>
>>   - a sense of time vaguely related to execution rather than wall clock
>>   - determinism
>>
>> I would love to divorce the former from icount and punt it to plugins.
>> The plugin would be free to instrument as heavily or lightly as it sees
>> fit and provide its best guess as to guest time on demand. I wrote this
>> idea up as a card in Linaro's JIRA if anyone is interested:
>>
>>   https://linaro.atlassian.net/browse/QEMU-481
>>
>> Being able to punt cost modelling and sense of time into plugins would
>> allow the core icount support to concentrate on determinism. Then any
>> attempt to enable icount for MTTCG would then have to ensure it stays
>> deterministic.
>>
>> Richard and I have discussed the problem a few times and weren't sure it
>> was solvable but I'm totally open to hearing ideas on how to do it.
>> Fundamentally I think we would have to ensure any TB's doing IO would
>> have to execute in an exclusive context. The TCG code already has
>> mechanisms to ensure all IO is only done at the end of blocks so it
>> doesn't seem a huge leap to ensure we execute those blocks exclusively.
>> However there is still the problem of what to do about other pure
>> computation threads getting ahead or behind of the IO blocks on
>> subsequent runs.
>>
>> Anyway does anyone else have ideas to bring to the discussion?

Hat on to you O:-)

Open discussion with a Jira Epic and a good introduction.
I am sorry that I am not an expert (or even newbie) on that part of qemu
to give apport anything.

Thanks, Juan.


