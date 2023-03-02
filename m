Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C446A8391
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 14:32:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXj2G-0008TQ-M7; Thu, 02 Mar 2023 08:31:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam.zheng@bytedance.com>)
 id 1pXj2A-0008O9-2i
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:31:49 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fam.zheng@bytedance.com>)
 id 1pXj26-00072b-Ex
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:31:45 -0500
Received: by mail-wr1-x434.google.com with SMTP id v16so13722141wrn.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 05:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zJ72wLcoIJAhwLPYYo0uj/OrafpbMT+L9IeLyyWdvRE=;
 b=BZkrbXPqf57Q3LwcBLnSEcpXoXITZRrWdBPhwENkqJlNFNUFyHl6RSAdJAcjc2GuCl
 cZ7DXrkdZPTVptouNHz4WgmNb7x0X6NzPv7wUlnjifI1JyNkNKLZEX1xshAHCuPKogV9
 oObhzYUUvy+C5Kud+b2fQqg1gf8aGu0RIqvR3+p7LIZ2yICvwOtKCrAAy5pPSCVvgkD5
 4JV6DalLKFC3W4+LaLSH2kjWF09d1ufnwQiIfj9jTpWW8zq0kOuWLzL0fY3bummQbjof
 75+L3faRrosoizRgI/ycbs8p0AlX30o1nuYA6qFc5bfzFa3LkUFIewjkFlblHcYSoFms
 B8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zJ72wLcoIJAhwLPYYo0uj/OrafpbMT+L9IeLyyWdvRE=;
 b=TYi1LF4Kx053ulkvs8VR7YYJ/oMemeAXQThd0WgKOTnWv1zoSeZXhodLWSSLIhmv7v
 mly9lw1JtKqaJtzPI/d+KC+G2wJGVCpiiD5LWLAXdoSRrzK+jWKudTi7XgcMjxApVBoX
 8fOzgB/LyNT+DEN9LJx+7goINbmc3eULqUfyxYHx4rjeenSCC6VlW2VMgjM8ryKk0lnx
 NSEwJe4rMqlhJyP3dj4STJmwca2mrJEvXwpfZ+vbO1FYC5IMrAa+2RFJ67ShFDcIUvTk
 NKcOduHXRUHdJBs6Be4IwhVCeUS16XD1QKH3wvWNEVecfMw5itTcZkX/1GRauV30p+K7
 XpmQ==
X-Gm-Message-State: AO0yUKV+y0A+oPSZMI97qcNLdRUieGYdpU65cPu7YQxofKEHv20ejDYh
 A6fBiduBUfimPp+cCPz9bRGKNg==
X-Google-Smtp-Source: AK7set+8u8IHGkO/XILebj48lMvPsmsU1t/Br8sacMr9InZJarmiUb+KaQg0p15FW5Hc0mDzfzaC0w==
X-Received: by 2002:a5d:564f:0:b0:2c7:1206:85ff with SMTP id
 j15-20020a5d564f000000b002c7120685ffmr8214629wrw.48.1677763889145; 
 Thu, 02 Mar 2023 05:31:29 -0800 (PST)
Received: from smtpclient.apple ([93.115.195.2])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a5d4cc2000000b002bfd524255esm15010913wrt.43.2023.03.02.05.31.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Mar 2023 05:31:28 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [External] [PATCH] hostmem: Add clear option to file backend
From: Feiran Zheng <fam.zheng@bytedance.com>
In-Reply-To: <cd366355-0589-eba1-bfa0-bd2b9ee117a8@redhat.com>
Date: Thu, 2 Mar 2023 13:31:17 +0000
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Peter Xu <peterx@redhat.com>, Fam Zheng <fam@euphon.net>,
 Igor Mammedov <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <409947D6-4B0F-4D72-840E-D04AF3BF6C71@bytedance.com>
References: <20230302110925.4680-1-fam.zheng@bytedance.com>
 <377c3521-ffe1-074b-48ac-71fd445b3bb4@redhat.com>
 <15DA845E-C50C-46BB-A241-164E5851E388@bytedance.com>
 <9c14c247-0184-35e8-6399-b542e4e20129@redhat.com>
 <D936CC04-15BB-4F77-A2F6-919225EA06C1@bytedance.com>
 <cd366355-0589-eba1-bfa0-bd2b9ee117a8@redhat.com>
To: David Hildenbrand <david@redhat.com>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=fam.zheng@bytedance.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> On 2 Mar 2023, at 11:54, David Hildenbrand <david@redhat.com> wrote:
>=20
> On 02.03.23 12:48, Feiran Zheng wrote:
>>> On 2 Mar 2023, at 11:39, David Hildenbrand <david@redhat.com> wrote:
>>>=20
>>> On 02.03.23 12:37, Feiran Zheng wrote:
>>>>> On 2 Mar 2023, at 11:31, David Hildenbrand <david@redhat.com> =
wrote:
>>>>>=20
>>>>> On 02.03.23 12:09, Fam Zheng wrote:
>>>>>> This adds a memset to clear the backing memory. This is useful in =
the
>>>>>> case of PMEM DAX to drop dirty data, if the backing memory is =
handed
>>>>>> over from a previous application or firmware which didn't clean =
up
>>>>>> before exiting.
>>>>>=20
>>>>> Why can't the VM manager do that instead? If you have a file =
that's certainly easily possible.
>>>> Hi David,
>>>> Technically yes, but I have a simple VM manager here which wants to =
avoid replicating the same mmap code, such as handling the flags =
depending on share=3Don|off,hugepages=3Don|off. All in all this approach =
requires the least additional code to achieve it.
>>>=20
>>> so ... we're supposed to maintain that code in QEMU instead to make =
your life easier ? :)
>>>=20
>>> Sorry, for this particular use case I don't see the big benefit of =
moving that code into QEMU.
>>>=20
>> I am posting because this does not only makes my life easier, =
supposedly it also make other developers life easier, because the file =
here can be a char file and there is no easy way to clear it =
(/dev/dax1.0) from command line if you want to invoke a QEMU command =
directly.
>> Maybe I=E2=80=99m missing a convenient command to clear a DAX char =
file?
>=20
> Can't you simply use dd and read from /dev/zero?
>=20

I don=E2=80=99t think it works for dax because the fs driver only =
implemented mmap, not read/write:

# strace -e write dd if=3D/dev/zero of=3D/dev/dax1.0 bs=3D1G count=3D1
write(1, =
"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., =
1073741824) =3D -1 EINVAL (Invalid argument)
write(2, "dd: error writing '/dev/dax1.0':"..., 50dd: error writing =
'/dev/dax1.0': Invalid argument

Fam=

