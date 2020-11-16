Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 343812B43EB
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:44:45 +0100 (CET)
Received: from localhost ([::1]:60218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kedsC-0000Sv-94
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:44:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kedq5-0007QI-EQ
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:42:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kedq3-00017B-EQ
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:42:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605530550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mP1v86jRGhq+/dMDVRaDW/cvSEMOoR9iqymkgX74pOA=;
 b=Mp1gOi+MDl/aWWpp4/QE8FFl6Tyw6YcrgJ1q1MXzbbeXDYnMT+kKdNJRVPAbJlYlitHGOM
 5N3Gxml0l59u18FCcCWOB50nAu0SurDlB/3wwiGQUcW7+ZuhOoeORspeNB/V+3Yp/GULUO
 YESk8+hUnfryYkIkQ2EAXCJEodccI80=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-SgiDu2O_MHKkTDBSIH3Wog-1; Mon, 16 Nov 2020 07:42:26 -0500
X-MC-Unique: SgiDu2O_MHKkTDBSIH3Wog-1
Received: by mail-wm1-f69.google.com with SMTP id u123so8664572wmu.5
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 04:42:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mP1v86jRGhq+/dMDVRaDW/cvSEMOoR9iqymkgX74pOA=;
 b=H2e+IpQmhPGTJB9FnK1SkciJUExk20gRDrlpfr7rGe1KwFzZxbWavzriifsXoZokA/
 L4J/SQMaNt67SH9JjB3uHyv34CnFichG4NRrvSGomD9zS7kHQV3GDVDdct1wnNBawBXh
 gdqcLs8HLvh3lfH0PH3jPHEt9JZYJe52DhsIOgxOFm+lIV8HlSqKaxxAOMqd3KlDHs33
 /BOXFhP7f7/W5KKRiunYlUEaeqWE2IDxHZ1INLBGQR1jISZfCXAGbC9WUOaWHQ+KVLHi
 TeerG8/ckRsrDl1sbo8E6y8I489830lEeOnmZKuKAUwbXfBYzpkDsOFFCqaZqMIrC8lQ
 UGqA==
X-Gm-Message-State: AOAM532VVqroiGEyQyWd9OvUhb39GJJ9cbaE3Vs5ur2C1ND+A5bjRgoC
 IuCWkCHATu3avmNajQcujb4M0XcFBMnPWV68oy14wTkc+a4T/LuidYCPjQKg9TUUwKh93SCnmZ4
 S3mi7iWM7lPs3qa4=
X-Received: by 2002:a5d:4c52:: with SMTP id n18mr19188960wrt.68.1605530545446; 
 Mon, 16 Nov 2020 04:42:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/w3v7xMf1dwKBpG41Yvv8kxQLXvvKOBxYnsnOzq399BRB+iv+phvkj9FC438/3Vu2SAfGdg==
X-Received: by 2002:a5d:4c52:: with SMTP id n18mr19188941wrt.68.1605530545285; 
 Mon, 16 Nov 2020 04:42:25 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id u8sm19796651wmg.6.2020.11.16.04.42.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 04:42:24 -0800 (PST)
Subject: Re: [PATCH] tests: add prefixes to the bare mkdtemp calls
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20201113133424.8723-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f44e1f60-c90e-8db0-c481-9104bd96ddf7@redhat.com>
Date: Mon, 16 Nov 2020 13:42:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201113133424.8723-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@hackbox2.linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/13/20 2:34 PM, Alex Bennée wrote:
> The first step to debug a thing is to know what created the thing in
> the first place. Add some prefixes so random tmpdir's have something
> grep in the code.
> 
> Signed-off-by: Alex Bennée <alex.bennee@hackbox2.linaro.org>
> ---
>  python/qemu/machine.py                    | 2 +-
>  tests/acceptance/avocado_qemu/__init__.py | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


