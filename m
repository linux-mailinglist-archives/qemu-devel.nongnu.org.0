Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A95376BCDC9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 12:16:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pclZm-0007cJ-Ld; Thu, 16 Mar 2023 07:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pclZk-0007c6-Rp
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 07:15:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pclZj-0005hi-EG
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 07:15:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678965314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=70R0MsZIaE4PkhMcUjqL0qpwcQdpE6GcotawEP6/f70=;
 b=FNmE6pBOcnqrsRDK1GWZOfV4tVSYcSuGYMDvrURJRRfalLSxrF9YnsQkSxgd58aJaxxFHo
 ZBw2HR2dOxQz47SN5towwYLlF2RdPkSjVeTVNuwrIkBdKuV09EA4MdNmMKVJ+EsA3rCvWa
 N367HVHCnvWfQSoum4kZgNiplYmCSdQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-v9BTvEDGMbGOBhKcM3-EtQ-1; Thu, 16 Mar 2023 07:15:10 -0400
X-MC-Unique: v9BTvEDGMbGOBhKcM3-EtQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 c1-20020a0564021f8100b004acbe232c03so2517783edc.9
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 04:15:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678965310;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=70R0MsZIaE4PkhMcUjqL0qpwcQdpE6GcotawEP6/f70=;
 b=TiST945CxyaMK1fHCryPtWjf9xLHoqTOD+cj0eL19+M3ntYCNhAeuy/4KqLSCP3n8W
 yrBj6o7Ujk1ekc+wiz1zn3Uz9/aQUVUNxLPg81Ru7SGfdu3G98RGxv8UO7OJEnwecdUc
 ygtG3mIAJYQL0H1VRAaojAAbmb1M6JR7/M/MNA4zNlMSVgWGHMXcRgPK4DzyGTnVOTyu
 dRT4ASINsD3Vipcg7Se3dcDLTg+L/pXdo4d9ZwTrhhiDnADm60b0ayOQDcXrfAPBeEhJ
 uFlhRlwbbPI+Mqg81dJ6IgSSnhYUhcSaJ1m58KUf7d0WYC1w+Xxl87CZEgmfroZPdr2I
 R1dg==
X-Gm-Message-State: AO0yUKXwPXuoJ02gS3tt270AL1v4th/MrN39vKRNQtPAjFS8EyLyoizG
 5VovI6TQzB4zUkzBLUw5wt3cdErOpGUe2ty6QDDpDxetO8U9TYkR1Y1rF48Lp30Yer1E1WRX/UZ
 yto0GYDBBIkgDIlE=
X-Received: by 2002:a17:906:1e12:b0:886:ec6e:4c1 with SMTP id
 g18-20020a1709061e1200b00886ec6e04c1mr10157237ejj.59.1678965309899; 
 Thu, 16 Mar 2023 04:15:09 -0700 (PDT)
X-Google-Smtp-Source: AK7set9w0fOHSTddqzkONsvFz6pHwv1vCfrYrxOoJjxbbKByQqEkOgu9TX+doe8kiDHKG6iqVhfrcQ==
X-Received: by 2002:a17:906:1e12:b0:886:ec6e:4c1 with SMTP id
 g18-20020a1709061e1200b00886ec6e04c1mr10157218ejj.59.1678965309645; 
 Thu, 16 Mar 2023 04:15:09 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-151.web.vodafone.de.
 [109.43.176.151]) by smtp.gmail.com with ESMTPSA id
 c37-20020a509fa8000000b004fb17f10326sm3699843edf.10.2023.03.16.04.15.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 04:15:09 -0700 (PDT)
Message-ID: <08eeffa7-3447-1dab-4dd7-13db9d1d72b3@redhat.com>
Date: Thu, 16 Mar 2023 12:15:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: dropping 32-bit host support
Content-Language: en-US
To: Andrew Randrianasulu <randrianasulu@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-discuss@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
References: <CA+rFky6A9Q_5sJ4WDO-Z2HBT59qiNgr8A-xk+O7-gnAMZmHt2A@mail.gmail.com>
 <f06fddef-1e40-1858-2715-50a0518a97f6@linaro.org>
 <CA+rFky5=kc0Pwf3RRhuKrBqtRVkmtm=NDKhrVgJV2_Ame2nUOQ@mail.gmail.com>
 <c33b0e07-5c46-6ebe-fe4c-5308ce508a70@linaro.org>
 <632e7256-34f5-ca87-ff60-a5c11aa1dd7f@redhat.com>
 <CA+rFky6WqdLjNpeU3sCXwjwMEuEK+XVHE5BBCKYC=umRGK81eg@mail.gmail.com>
 <CA+rFky4su7ZEo8pNQGk3qEkTOLEkFAqO2Tsrh6VyDaNOf7w=_Q@mail.gmail.com>
 <333abd8d-035d-b9c9-a934-26876d33d7d0@linaro.org>
 <CA+rFky6Gcf0oTT58ZbScm1hfQC9kdHNYE+ABSsKc0=jy31Xvjg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CA+rFky6Gcf0oTT58ZbScm1hfQC9kdHNYE+ABSsKc0=jy31Xvjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 16/03/2023 12.04, Andrew Randrianasulu wrote:

> Also, for CI thing may be lessen compiler optimization levels at least for 
> some runs? And/or tweak ccache compression ....

Please stop blindly making suggestions for our CI if you don't really know 
it (e.g. we don't use ccache). That's really not helpful. Thanks.

  Thomas



