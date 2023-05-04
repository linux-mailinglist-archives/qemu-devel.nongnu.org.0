Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A376F6521
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 08:36:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puSZQ-0001Py-HV; Thu, 04 May 2023 02:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1puSZN-0001KB-IV
 for qemu-devel@nongnu.org; Thu, 04 May 2023 02:36:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1puSZM-0003i0-3d
 for qemu-devel@nongnu.org; Thu, 04 May 2023 02:36:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683182158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1jKtQbeNrVp3EcXhTE/QQuBctxizzoY/P6tOSAokhCg=;
 b=MIs9NP28388CJH6Lb1TbLQXkGvbeyZ1jAHYLHN9u/jg8oy348O1P+XxIpYsG6lQ2prA4IL
 OuoYvNRaJNlEqLaXNdYE2ZH092CJZNGFJN7W7b0/gGIwQh2DqrJtF0QqTPr2wfExmDkzs0
 h59TlmKRkcxVrcG+0vwbR0TRy68CL84=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-MSvSDTpmPVSuE12SFBZpNQ-1; Thu, 04 May 2023 02:35:57 -0400
X-MC-Unique: MSvSDTpmPVSuE12SFBZpNQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-94a341ee4fcso11718066b.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 23:35:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683182156; x=1685774156;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1jKtQbeNrVp3EcXhTE/QQuBctxizzoY/P6tOSAokhCg=;
 b=HjWR7BHeduuHUVl6p3T6gzQCxhByo/snn4GUSSQ42ZKgH0kqTFgMwuSLJgpxNuiIYd
 ZY1ZG9qzVRMxCtZbNaFj8ginDF6MwoWluk9gekOhe0cZhqDo+yHFQGNguTICV1GNmKsY
 AzwaZG7vy3UiO9W8MK6pDrf4RY9EcbX9IYhmZTqzO9LDZnJ6tSSz+UamF3A6SMcBDJAN
 hUVwlcViFMP6aDsQ6dsgqnDlb7BCV8Jw4MKlVuJxeu9CcDTvSG3DoqvbWocdw0SZLFvP
 LpqVTsA9VgoJnlT2Jy6hX2oOvB5/zeVZP1qDMIEUUPspXuG3rWKKBDSGLdiCuqyz+l4e
 O47g==
X-Gm-Message-State: AC+VfDw2sF+ztf2sJVucnHTlil7IH5vf9WqDud86vo5Lp4IS9dHufqVo
 ZgZLx4Ts0PIq2e94ne48LryRcqq+FxXcQjKhwoYaZB2z7fDofLpa+kbgL+LGWa89UVOlY+Fvs8d
 0ccLRi2ne7BQfS9U=
X-Received: by 2002:a17:907:3e98:b0:94f:7a8:a902 with SMTP id
 hs24-20020a1709073e9800b0094f07a8a902mr5643008ejc.14.1683182156072; 
 Wed, 03 May 2023 23:35:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Jo3dJ6IVlkC6Oa2dQOjVI+6cYlEp5sZSOqTncZRlWIKGFC1n2fVn6M5cwuubtCz1hF174xg==
X-Received: by 2002:a17:907:3e98:b0:94f:7a8:a902 with SMTP id
 hs24-20020a1709073e9800b0094f07a8a902mr5642993ejc.14.1683182155786; 
 Wed, 03 May 2023 23:35:55 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-91.web.vodafone.de.
 [109.43.179.91]) by smtp.gmail.com with ESMTPSA id
 h20-20020a1709070b1400b009658f5a90d2sm1045382ejl.189.2023.05.03.23.35.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 23:35:55 -0700 (PDT)
Message-ID: <8d7e46ec-95c0-5c4a-a843-20106576e9ba@redhat.com>
Date: Thu, 4 May 2023 08:35:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/2] Add mformat and xorriso dependencies in containers
Content-Language: en-US
To: Ani Sinha <anisinha@redhat.com>, alex.bennee@linaro.org,
 philmd@linaro.org, wainersm@redhat.com, bleal@redhat.com
Cc: qemu-devel@nongnu.org, mst@redhat.com, berrange@redhat.com
References: <20230503145547.202251-1-anisinha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230503145547.202251-1-anisinha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 03/05/2023 16.55, Ani Sinha wrote:
> mformat and xorriso tools are needed by biosbits avocado tests. This patchset
> adds those two tools in the docker container images.

tests/qtest/cdrom-test.c already uses genisoimage to create ISO images, and 
the containers already have that tool installed. Could you maybe switch the 
biosbits test to use that tool? Or the other way round? ... at least having 
two tools to create ISO images in our containers sounds IMHO excessive.

  Thomas


