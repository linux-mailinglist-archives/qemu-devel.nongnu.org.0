Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D5A2F629C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 15:03:22 +0100 (CET)
Received: from localhost ([::1]:41020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l03Dd-0003le-6m
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 09:03:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l039p-0001lQ-7y
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:59:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l039n-0006sa-LW
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:59:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610632762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c5mzTuyw3eCmopY3vKzIHzRiPut6sX36R/QqkYhKhqQ=;
 b=LqO4rVcFg2GM/j08uSCxjOsZkCtMW7nKAUCOYg0ivzd4hW4W0ydk9oHRsVO2EeJ44cV3FB
 qZ5PgqA2q7U6qzJvo+y8bZW5oPljVU4CqxA06iieScq6/rVGJzEpRsmI2xEctPqa+iuGS9
 HEGQG8TMgPkuXrmy3Yip/VG7/SKnk5Y=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-rkateo8pPjmQH02Fwa9PCw-1; Thu, 14 Jan 2021 08:59:21 -0500
X-MC-Unique: rkateo8pPjmQH02Fwa9PCw-1
Received: by mail-wr1-f69.google.com with SMTP id l10so2220286wry.16
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 05:59:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c5mzTuyw3eCmopY3vKzIHzRiPut6sX36R/QqkYhKhqQ=;
 b=C3SBlHffNLisfM6xsJmSK/ydbm8EYh7eKMxqeGTphbEmiHdLivqbeZkBxOftWN1xWG
 ULHzLQKlzyx2KsuaovgxwoMgVmaSe4Pbgej7BrYOIQtt7/wcUf4uf7muPW40+kowr1cF
 RmQpAVfJOzfKoffXDmnM3gAJXfQCnjU6CRvjtYp8uaVIGIHXohLmx4VXZggXaS1b7BIm
 1TCK/ygW4tnHk3GM9I7A5xUmYFKv+D4X9nyoGuVLJVkbFCjGeJvUesBdu6d/pLgXezC7
 MXr2aIgck2NGK2aJFgml14aPNYP92m2j49MP7N66+2djebSrAR3LAyNPT1kXhAvfgHSn
 9VmA==
X-Gm-Message-State: AOAM533AWTv9QfSHAhcF/SnFheXTCywJEI1mxSxRmGIQr4AcsoL+alRq
 ptid+mU/vHuo7OazTEgbiJqIDCHUut1Bvlp4DicAzUHByAY4WNHq6deUcQ+8nr9SJzBmnA7K0MC
 pSUuNkrVLoiRS4kY=
X-Received: by 2002:a5d:684b:: with SMTP id o11mr8068419wrw.157.1610632759973; 
 Thu, 14 Jan 2021 05:59:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQuoDRbuBGsMUJ3UHZpH1RGC98mGzit3g2H54vPUF0jmp0Bfg7Aj9wlLQekPs/3hlhAvZc7g==
X-Received: by 2002:a5d:684b:: with SMTP id o11mr8068413wrw.157.1610632759869; 
 Thu, 14 Jan 2021 05:59:19 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id l8sm8890797wmf.35.2021.01.14.05.59.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 05:59:19 -0800 (PST)
Subject: Re: [PATCH v2 18/25] tests/docker: expand opensuse-leap package list
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210114130245.1654081-1-berrange@redhat.com>
 <20210114130245.1654081-19-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <30fa8f27-1a57-2aaf-c74d-549dce506290@redhat.com>
Date: Thu, 14 Jan 2021 14:59:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114130245.1654081-19-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/21 2:02 PM, Daniel P. Berrangé wrote:
> This is the fully expanded list of build pre-requisites QEMU can
> conceivably use in any scenario.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/docker/dockerfiles/opensuse-leap.docker | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


