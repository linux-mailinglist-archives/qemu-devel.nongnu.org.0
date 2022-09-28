Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2BA5EDD35
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 14:55:19 +0200 (CEST)
Received: from localhost ([::1]:46982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odWas-0001V2-3V
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 08:55:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odTS5-0006VG-AE
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 05:34:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odTS2-0002wD-14
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 05:33:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664357637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xh7TXWUoYsiaZ0/EjTH4UWsTHEIx8aoq6XGMXWRNgL8=;
 b=DrgPrtkzV5fKxX8FYrA8IUbCUpHiROPUORNEk+9ipjzsBOh6grsDieCHiDYOOoh7he8MFg
 c4trAPwdtTR7xEaJJRq5TLymddt1h6TyGeD22GGOsFrC48eOMzri31bzekzkdnQebIlbtG
 l9qCXFhs3VpyzvWMLPErm8QvLOU6f3U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-387-_J2xdoKJOrm-OI0PkHc7bw-1; Wed, 28 Sep 2022 05:33:55 -0400
X-MC-Unique: _J2xdoKJOrm-OI0PkHc7bw-1
Received: by mail-wr1-f71.google.com with SMTP id
 k6-20020adfc706000000b0022cc19d5dd2so1107583wrg.7
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 02:33:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=xh7TXWUoYsiaZ0/EjTH4UWsTHEIx8aoq6XGMXWRNgL8=;
 b=R7aqoKasm63Feb+F/bGuDnNj1kwWqHlesmZVUU6sX8dGvWRhJwLywNVNMPnn81BKdM
 5z5dvz1IMeUqlFkelhH7/MLONSY6JNEdB5Y0CHEV5x4N6LDJqvn0UFj54nvZbx/C3Kdz
 fk+maU9nkDXfRCWHnU1UmVGTYrAGV/s7fiAVMstkRNCXUtm91tPLFn4OGkPi7gs/Zfni
 tDK/ON+Fy8UkBl4vfRCu6Olm8XtdC/S3bBmCP1SB+TIK2YtMZV1kn1XAS26ehidDcbpQ
 0Yu84Jr7ABLFqNJ8D/yTKKz7WFI2aors5/JJvjMvSFd14hNnuFDVpbp0YcoPy5SC3iuX
 35ew==
X-Gm-Message-State: ACrzQf2x4BrMp+K8SN829lz5mMr+XYfortsmJVmPEEJQxE1j++Bq9FG1
 P18MiH3TEtdUKyYlBWlQAvZtSPNxabbo2gp2VX1YYMPkgckUoTqzK6RzQn4rsJj/2Mr37kTveiQ
 PQgknpz8by+zKAyo=
X-Received: by 2002:a7b:ce95:0:b0:3b4:5de8:2f34 with SMTP id
 q21-20020a7bce95000000b003b45de82f34mr6085283wmj.194.1664357634540; 
 Wed, 28 Sep 2022 02:33:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4KJDtPQWHMVbMQM3S83X8GnpIcpz0VbwGRlyb1U/pUsH3kCUapZvaFrAkJWYAHKy6eAiRFGQ==
X-Received: by 2002:a7b:ce95:0:b0:3b4:5de8:2f34 with SMTP id
 q21-20020a7bce95000000b003b45de82f34mr6085265wmj.194.1664357634274; 
 Wed, 28 Sep 2022 02:33:54 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-89.web.vodafone.de.
 [109.43.176.89]) by smtp.gmail.com with ESMTPSA id
 x4-20020adfdcc4000000b0022b11a27e39sm3840384wrm.1.2022.09.28.02.33.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 02:33:53 -0700 (PDT)
Message-ID: <654ed688-55c2-6ea5-6f02-5ba6b4454863@redhat.com>
Date: Wed, 28 Sep 2022 11:33:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: Why we should avoid new submodules if possible
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 imammedo@redhat.com, qemu-devel@nongnu.org
References: <20220628030749-mutt-send-email-mst@kernel.org>
 <7bf5976e-8277-7c78-f412-44f7be8754f4@redhat.com>
 <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
 <20220628060210-mutt-send-email-mst@kernel.org>
 <d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com>
 <20220928052352-mutt-send-email-mst@kernel.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220928052352-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 28/09/2022 11.26, Michael S. Tsirkin wrote:
> On Tue, Jun 28, 2022 at 12:21:39PM +0200, Thomas Huth wrote:
>> On 28/06/2022 12.03, Michael S. Tsirkin wrote:
>> [...]
>>> For biosbits if we are going this route then I feel a submodule is much
>>> better.  It records which version exactly each qemu version wants.
>>
>> As far as I know, you can also specify the version when using pip, can't
>> you? So that's not really an advantage here.
>>
>> On the contrary, submodules have a couple of disadvantages that I really
>> dislike:
>>
>> - submodules do not get updated automatically when doing a "git checkout",
>> we have to update them via a script instead. This causes e.g. trouble if you
>> rsync your source tree to a machine that has no access to the internet and
>> you forgot to update the submodule before the sync
>>
>> - the content of submodules is not added to the tarballs that get created on
>> the git forges automatically. There were lots of requests from users in the
>> past that tried to download a tarball from github and then wondered why they
>> couldn't compile QEMU.
>>
>> - we include the submodule content in our release tarballs, so people get
>> the impression that hte submodule content is part of the QEMU sources. This
>> has two disadvantages:
>>   * We already got bug reports for the code in the submodule,
>>     where people did not understand that they should report that
>>     rather to the original project instead (i.e. you ship it - you
>>     own it)
>>   * People get the impression that QEMU is a huge monster
>>     application if they count the number of code lines, run
>>     their code scanner tools on the tarball contents, etc.
>>     Remember "nemu", for example, where one of the main complaints
>>     was that QEMU has too many lines of code?
>>
>> - If programs includes code via submodules, this gets a higher
>>    burder for distro maintainers, since they have to patch each
>>    and every package when there is a bug, instead of being able to
>>    fix it in one central place.
>>
>> So in my opinion we should avoid new submodules if there is an alternative.
>>
>>   Thomas
> 
> So looking at the latest proposals downloading files from CI,
> checksumming them etc etc. No auto checkout, not added automatically
> either, right?
> 
> This seems to be the only difference:
> - we include the submodule content in our release tarballs
> 
> How about we just fix that? Thomas would that address your
> concern at least wrt tests?

If I'm not forced to checkout that submodule, and if we don't add it to the 
release tarball, I guess there's not much left I can complain about ;-)

  Thomas


