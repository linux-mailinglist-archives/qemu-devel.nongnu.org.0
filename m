Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD87362F722
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 15:20:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow2D1-0007Rh-G5; Fri, 18 Nov 2022 09:19:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ow2Cz-0007R2-6r
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 09:19:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ow2Ct-0000yF-DL
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 09:19:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668781142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NIQXKv9hoTI54ldR6fW56zHzkQfTtz/meRAlqUnIp7E=;
 b=S8s8WaiF/og30T36CppxB6Dk1Q/9OST2cwRu1dxgN6lSMSfjZQcPqlLMUCB5PDUkEsftqv
 eCz9467rjmIfR1a/GIIyZXQairrfssU/Dr4kOk5Va0FTuXGuwq1S6vLUw9n2gaeRzElH9a
 ZX1PbrkC70MeHLyZUsdN0ySywKF0gtE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-621-A4Wj95JWPjOV56J8s5ZONQ-1; Fri, 18 Nov 2022 09:19:01 -0500
X-MC-Unique: A4Wj95JWPjOV56J8s5ZONQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 l1-20020adfa381000000b0024184dfcb5eso1638147wrb.21
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 06:19:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NIQXKv9hoTI54ldR6fW56zHzkQfTtz/meRAlqUnIp7E=;
 b=t+8R4jpz8Ji1yoK2r8nTZYenyulObRaMMtqYZ6zHai8SZjkXa5qsT8rgOdsPGp8GR1
 qO2yiwd9Jx/8LM+9JeILxnaARWF9pLCYS0etYNAMNILqfCx+N7K/CKfM6fz0RfLKlGzE
 f6BhR9jHrpUhDtq0XDmAHy9kQa55nCUDAoSKKZZaeX4ZFksqZPgt4XrzwleYcxZC1EMa
 x/VAgLJcV77HNFJtO/Palfedijatbrs2aWyiKPR/WpSP+vs85Daivt7PPZ/rt7gXeMC+
 TvZZ7QW0lPrvx3N3EERELtaaXlPxBRpIqSfm2lEORVfW/aSVSihGFvqgYM/5Uer90ROz
 9SVA==
X-Gm-Message-State: ANoB5pnUF+l6TTZOYc2CtRaNGdV/mCfzpaC8upjbIQysM5VWLCwGAzQ4
 BxmzuTaSOAQyyb7f2xif27UkpbFEfwo34/ctGmmln4XA1R/cKEs6exr3vWQ2cB9ZK2lk1vC6mhs
 gj3Rv0XK0kEK+32M=
X-Received: by 2002:adf:db81:0:b0:236:5144:f8ce with SMTP id
 u1-20020adfdb81000000b002365144f8cemr4439918wri.657.1668781140214; 
 Fri, 18 Nov 2022 06:19:00 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4lLbnmMXKQgXx3d6wZmliVLQ/yyEqVQMTC7v+I+bv7JTEDRG3nb3jH/bAJoYwIOqw+hG9qcg==
X-Received: by 2002:adf:db81:0:b0:236:5144:f8ce with SMTP id
 u1-20020adfdb81000000b002365144f8cemr4439905wri.657.1668781139930; 
 Fri, 18 Nov 2022 06:18:59 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-78.web.vodafone.de.
 [109.43.177.78]) by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c458700b003a3170a7af9sm4974974wmo.4.2022.11.18.06.18.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 06:18:59 -0800 (PST)
Message-ID: <0dc256bb-d163-66de-a448-389e52c908d3@redhat.com>
Date: Fri, 18 Nov 2022 15:18:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH] tests/avocado: use new rootfs for orangepi test
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, philmd@linaro.org, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221118113309.1057790-1-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221118113309.1057790-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 18/11/2022 12.33, Alex Bennée wrote:
> The old URL wasn't stable. I suspect the current URL will only be
> stable for a few months so maybe we need another strategy for hosting
> rootfs snapshots?

Looking at 
http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/ 
there are only images for the very last month available - so the new URL 
will likely be invalid in one month already. That's not usable. I think 
you've got to find another solution or remove the test.

  Thomas



