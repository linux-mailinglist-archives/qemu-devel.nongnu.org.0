Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C1D686662
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 14:08:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNCps-0007yh-ON; Wed, 01 Feb 2023 08:07:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNCpn-0007xy-Oj
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 08:07:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNCpk-0000W0-PH
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 08:07:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675256847;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fQS/tcjv1fnUP4Oml7nphciDVp9alnZIFqlUsHNlXn0=;
 b=DjmBlNaNoIqXVPrKH1sv2zBE/DPS7YKLZgUrDKigwv5DTJQUHcP6QfXd6fVpG5CRf21Mig
 WXVrH/9Mar/VudSxi+C5F16awblKet2IdxZE3wjfaFihdvCgKuetxrOv2HoztOjX4uUKbf
 QSPn6blynLIrBlN6sOgkI6MiOKZIAmY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-619-qTkL9j9oOemzUpNferUMBQ-1; Wed, 01 Feb 2023 08:07:26 -0500
X-MC-Unique: qTkL9j9oOemzUpNferUMBQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 h2-20020a1ccc02000000b003db1ded176dso959798wmb.5
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 05:07:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fQS/tcjv1fnUP4Oml7nphciDVp9alnZIFqlUsHNlXn0=;
 b=3a3MDUwJKCkb+QqjGc9pClO4jSKGEJMNAL8cC/uE8TByncVxCm2HpLLPmqVdKWWz4A
 Y8JPFWXeb4huo7fSDe5UuIRn9IssAr6KvddHiQDJAYc72pg774L7mjkULRgDba8WB1GM
 W45uDOsOAvI1vbiy4DzhTzag3QmXaXWL7ULwdsgS/B+GPUezO2A7yJzO0rMstN9aMUXf
 KPrUyfRJAMmfbvRrF5YiOw7eghXrc+G4UgO1HRBOSeW34LuBHG8jKwtxWof6Bb+jRPqU
 obgJKQ2DJbnLXgQyZfguyt8CrOB9/lDK4cYeq7kV12kdODZQQ7vTBkT0xfk9lUQ3iZZ/
 7lIw==
X-Gm-Message-State: AO0yUKUhaEGSEj7LJe5XaTKtrdKAdEk5U5XL+IGe655DdD3Cxw2a1T7+
 p5iiIdIeJMpoKY0+asfXZKURX2MBldrTJ+IVez8v4nHG4oak6yVT/pp6u7RzqkIbzspNfuDQtoG
 ByxVjYMZSvMDPqOE=
X-Received: by 2002:a05:600c:1c06:b0:3d9:fb89:4e3d with SMTP id
 j6-20020a05600c1c0600b003d9fb894e3dmr2177327wms.28.1675256845161; 
 Wed, 01 Feb 2023 05:07:25 -0800 (PST)
X-Google-Smtp-Source: AK7set+GV4uVs1npm+MwOx9SL7dgX/fQzyODEKn3cWDr4cCP6vpSy4jB3S7f45LJaDehkwd8a0L1iQ==
X-Received: by 2002:a05:600c:1c06:b0:3d9:fb89:4e3d with SMTP id
 j6-20020a05600c1c0600b003d9fb894e3dmr2177298wms.28.1675256844788; 
 Wed, 01 Feb 2023 05:07:24 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c465100b003dd1c45a7b0sm1688380wmo.23.2023.02.01.05.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 05:07:24 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Fabiano Rosas <farosas@suse.de>,  Laurent Vivier
 <lvivier@redhat.com>,  qemu-arm@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 06/11] tests/qtest/migration-test: Reduce
 'cmd_source' string scope
In-Reply-To: <ee0cad00-a6f3-f0c1-adf0-ba32329354f3@redhat.com> (Thomas Huth's
 message of "Tue, 31 Jan 2023 15:23:48 +0100")
References: <20230120082341.59913-1-philmd@linaro.org>
 <20230120082341.59913-7-philmd@linaro.org>
 <87a620my1s.fsf@secure.mitica>
 <ee0cad00-a6f3-f0c1-adf0-ba32329354f3@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 01 Feb 2023 14:07:23 +0100
Message-ID: <87fsbpfsac.fsf@secure.mitica>
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

Thomas Huth <thuth@redhat.com> wrote:
> On 30/01/2023 05.44, Juan Quintela wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>> I am assuming that you will pull this patches through tests tree,
>> not
>> migration tree.
>> Otherwise, let me know.
>
> I had some remarks (in v2 of the series), so I'm not going to pick
> this up (yet). If you want to take the migration part, feel free to do
> so.
>
> I still think it's quite a lot of code churn for just supporting
> multiple "-accel" statements here.
>
> What about introducing a new lib functions like this:
>
> char *qtest_get_accel_params(bool use_tcg_first)
> {
>     bool tcg =3D qtest_has_accel("tcg");
>
>     return g_strdup_printf("%s %s %s %s",
> 	      use_tcg_first && tcg   ? "-accel tcg" : "",
> 	      qtest_has_accel("kvm") ? "-accel kvm" : "",
> 	      qtest_has_accel("hvf") ? "-accel hvf" : "",
> 	      !use_tcg_first && tcg  ? "-accel tcg" : "");

I know that it is me, but I don't find the ? operator especially
readable.

What about:

GString *s =3D g_string_new("");
bool tcg =3D qtest_has_accel("tcg");

if (use_tcg_first && tcg)
   g_string_append(s, "-accel tcg ");
if (qtest_has_accel("kvm"))
   g_string_append(s, "-accel kvm ");
if (qtest_has_accel("hvf"))
   g_string_append(s, "-accel hvf ");
if (!use_tcg_first && tcg)
   g_string_append(s, "-accel tcg");

return s;

Yes, in the function that Phillipe is changing now, each time that I
have to change it, I have to count to see what and where I need to put
the format/change/whatever.


> }
>
> ... then all tests that want to run real code could simply call this
> function instead of having to deal with the list of supported
> accelerators again and again?

It is ok with me.

Later, Juan.


