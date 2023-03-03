Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2349B6A91DD
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 08:45:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY053-0001Vk-IJ; Fri, 03 Mar 2023 02:43:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY050-0001RN-AH
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 02:43:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY04y-00046C-Kg
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 02:43:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677829427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b0M2yXr1+REMzOrqKhbBEfUmP1zaYpHIyQJDVE+Mc94=;
 b=RYvjWqYJWQdrD903YrRTs5DRj+0mTm1o1SMtLwIjG7GicmR1CDAdcjmAj+ZPw7RJGpId8n
 nPV622jAsQUfEynHi7nc+aJf01J47TSwq6IB+vemYNAjVJWrLcHWkD4jIGKKC+LiCr3WhK
 HTfxwmdgdVmtw+ZRbzYOKp59fZhXtZ8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-U6r_MWutPJixyf8xIJ2M6Q-1; Fri, 03 Mar 2023 02:43:46 -0500
X-MC-Unique: U6r_MWutPJixyf8xIJ2M6Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 15-20020a056000156f00b002ca79db6d42so219377wrz.18
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 23:43:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b0M2yXr1+REMzOrqKhbBEfUmP1zaYpHIyQJDVE+Mc94=;
 b=Kdg7H8d4Dg3yfgSKIla+L756MHsBxkD4jLWxi2J+e/HGScTGLFADtcKMBZkeuHOpU+
 qnyTmoR9PI+vmjuSaQ8Y9978nCeU+IdOETII124hRMO1YBpgS1qj4P8oXm95Ip8X4hXc
 D4jsruZHmwAHYZrbc77pve3lG4N2vndqkbUttOdrAMT1JihMkuGiBw3pRA3fx2c7UJPH
 OgAxk5rHJb3Py00ZvOtBI8Djvkla7CxMBOGTY0RgiD3yXGOwJSWEliIWNpxHvK9dizH9
 itftAPBxgBex2/SIILUizFQQqfnh5lx5lpWqpMgP6Xkddsth87rQmrsrcXJ4FRs+32uk
 QFPA==
X-Gm-Message-State: AO0yUKUj0pVeLxHFNuRbRoB37jh30czdB8ZvGTrmGddSiBOBJUNtebIf
 E3yZXnAJCPi+GijJpjs1lXfoD1KSl+rSx+TM97FJPjka8xTwUmptlsnigAVOfHN16qxLl9KUa2W
 TS2yoVLPUf+1Qa3A=
X-Received: by 2002:a05:6000:10cc:b0:2c7:e60:abe8 with SMTP id
 b12-20020a05600010cc00b002c70e60abe8mr3317076wrx.9.1677829425270; 
 Thu, 02 Mar 2023 23:43:45 -0800 (PST)
X-Google-Smtp-Source: AK7set/QsYg7N7rExHDEG7uIrY/rCOaJKhTcYBDdcaskU7KkhFte9PM41rubtz6x4jCETb83X5RPUw==
X-Received: by 2002:a05:6000:10cc:b0:2c7:e60:abe8 with SMTP id
 b12-20020a05600010cc00b002c70e60abe8mr3317063wrx.9.1677829425003; 
 Thu, 02 Mar 2023 23:43:45 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-203.web.vodafone.de.
 [109.43.176.203]) by smtp.gmail.com with ESMTPSA id
 r3-20020a1c2b03000000b003e9ae2a8cbfsm1783317wmr.2.2023.03.02.23.43.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 23:43:44 -0800 (PST)
Message-ID: <e41e0828-7824-0611-dab6-d9a412c0874e@redhat.com>
Date: Fri, 3 Mar 2023 08:43:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests/qtest/migration-test: Disable
 migration/multifd/tcp/plain/cancel
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20230302172211.4146376-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230302172211.4146376-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 02/03/2023 18.22, Peter Maydell wrote:
> migration-test has been flaky for a long time, both in CI and
> otherwise

Acked-by: Thomas Huth <thuth@redhat.com>

Do you want to apply it directly as a CI fix, or shall I queue it for my 
next pull request?

  Thomas



