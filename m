Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9668467AB3A
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 08:54:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKabD-0006pT-S3; Wed, 25 Jan 2023 02:53:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pKabC-0006pK-OG
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 02:53:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pKabB-0005yZ-9v
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 02:53:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674633216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kaQeXSEqA7tAJkWYVxlVs5Qabn1lJYU3QabjwKzPGsw=;
 b=KwV2/DwoAI3HAK0M/BoOk+Xz991d1O06V/0w4Q7oSGXrqGurTbwmhLXJyYOuHKRc7y9c5C
 gOExGI5jV7oicuOt/1i4ziV2ElJ5sdedDiK36HbwV5DGO3Bz10f5lQkAQDOlXBfrSRaUtI
 5TpOThYBLt7cCGnzuDv+n8pzHsFOXIw=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-n3s7OBR5M8-sES8n5TM3Hw-1; Wed, 25 Jan 2023 02:53:29 -0500
X-MC-Unique: n3s7OBR5M8-sES8n5TM3Hw-1
Received: by mail-qt1-f198.google.com with SMTP id
 cr22-20020a05622a429600b003b694a9f291so6453755qtb.1
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 23:53:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kaQeXSEqA7tAJkWYVxlVs5Qabn1lJYU3QabjwKzPGsw=;
 b=ky5sC+aL0klrlLkfy5ZespbgLimVO2rY8Tso8QW+lGVl3bkmSSePJ/gzaGuKhu9bMl
 3ooF6ch/h+UHQayi3dOtQIHLupEbxBjy1kd+h2TvGJd4mXWb8O7hbMdxmsDxtEk0NLea
 I+c3HwxSlCTiDrogrTMKps856HpKc8OjY42TC5DhJEgt6jlNzaeFu1pxFPP2r6BwxV8k
 ID0NU2dTvTxHdRNZIBxnixRs9CEBtk0JQpv9Tx4CKEOBmd3ryvgrWFHZJBvzJQKdU/tE
 IjzEOaigPkdUX6rg+hDn10khuyyZADkAmBU4WWeRygU9ykriX7Y67Mg4mIcQ9UsBI9I5
 1l/g==
X-Gm-Message-State: AFqh2kphSzwpS+icVM79DAm1XICEAmBnLG8tGdUL58XLZrA6oqK1vVIC
 DDHG7mUoVkImhyivYcFOfVn1GvLotttes3ebXU4tu4055PJEKHgML4EThQaone2H9s/ZUyt5CEV
 CndMICH2xPbGAFs0=
X-Received: by 2002:ac8:4706:0:b0:3b3:8de0:cacd with SMTP id
 f6-20020ac84706000000b003b38de0cacdmr43658158qtp.32.1674633208937; 
 Tue, 24 Jan 2023 23:53:28 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv4p2rPkA8qGJVa+RjsE+Sb2NPi4SaPkM1PQSWjRWx16ih3yaAQAsbzzcK+HWE6+ph5wKaNtg==
X-Received: by 2002:ac8:4706:0:b0:3b3:8de0:cacd with SMTP id
 f6-20020ac84706000000b003b38de0cacdmr43658126qtp.32.1674633208713; 
 Tue, 24 Jan 2023 23:53:28 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-178-209.web.vodafone.de.
 [109.43.178.209]) by smtp.gmail.com with ESMTPSA id
 o3-20020ac80243000000b003a6a19ee4f0sm2876856qtg.33.2023.01.24.23.53.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 23:53:28 -0800 (PST)
Message-ID: <fed02d8c-8a56-1137-d11c-5e319a62f6f5@redhat.com>
Date: Wed, 25 Jan 2023 08:53:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 22/35] docs: add an introduction to the system docs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Alexandre Iooss <erdnaxe@crans.org>,
 Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 qemu-arm@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Li-Wen Hsu
 <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Kashyap Chamarthy <kchamart@redhat.com>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
 <20230124180127.1881110-23-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230124180127.1881110-23-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 24/01/2023 19.01, Alex Bennée wrote:
> Drop the frankly misleading quickstart section for a more rounded
> introduction section. This new section gives an overview of the
> accelerators as well as a high level introduction to some of the key
> features of the emulator. We also expand on a general form for a QEMU
> command line with a hopefully not too scary worked example of what
> this looks like.
> 
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>
...
> +That said, the general form of a QEMU command line can be expressed
> +as:
> +
> +.. parsed-literal::
> +
> +  $ |qemu_system| [machine opts] \\
> +                  [cpu opts] \\
> +                  [accelerator opts] \\
> +                  [device opts] \\
> +                  [backend opts] \\
> +                  [interface opts] \\
> +                  [boot opts]

FYI: My "git am" complains about a trailing white space after "[boot opts]" 
here. Please remove it.

  Thomas


