Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E4B5B3D15
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 18:36:27 +0200 (CEST)
Received: from localhost ([::1]:53916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWgzS-0001Ms-DB
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 12:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oWgvv-0007Oc-QR
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 12:32:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oWgvs-0006o2-Ik
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 12:32:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662741164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RjZWPEefh3Tfw20uEx0q+xurtVzmXi6niaVTBy0Dif8=;
 b=A+C4ohqyZTzNK7CqnvY1I0FCfCBqz/TPfkTgIQsinz3DCLzX4FltOz4YzDWRI5KFRa5Kio
 JQHqJtElHab4AvS0nIsAk9pZyriJptadBE4OhKbAvbVdurO634GfdiLUKN5USrIUqK7YNo
 OK/MzW64cktwBwP8lX9ITXFcItgBBEg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-505-wg2AEpRGNNyVfhiMZOCsrw-1; Fri, 09 Sep 2022 12:32:35 -0400
X-MC-Unique: wg2AEpRGNNyVfhiMZOCsrw-1
Received: by mail-wm1-f72.google.com with SMTP id
 i129-20020a1c3b87000000b003b33e6160bdso1366914wma.7
 for <qemu-devel@nongnu.org>; Fri, 09 Sep 2022 09:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=RjZWPEefh3Tfw20uEx0q+xurtVzmXi6niaVTBy0Dif8=;
 b=eRvi1XhCWIigz3zht6P8V+9NOtQfH8lkLclAzF9LZg8NCsBUY4fLwJHnSdzOnm6f2S
 Yk2yZunvnbHShTEkGp/UtwAk156EIaIElUnhlbJApxZYu6nyrfzvfwlFzFjF270wLf+Q
 nexcR+MV25672+F/M6UEzTkPeaA3EBXnXx1hjyQzEbCTF36eHnUJt2iGyTDO+UsR0cFZ
 pAWwIvYiWanIVcHnHDcEg3o4RbpOhiGJx0YOpQHcealG917sZ0zsZinf//GT7o8/SKym
 xcL19wlXmbOXJn2+U5Kp2ktA04WZr6s+vL3wbNghIGGpgJI9HmdUqOs3xlbSQF7a/74z
 LZnw==
X-Gm-Message-State: ACgBeo2CaQnM+vx+zw8TK2/IEt5m9ng3NtQ+tu9gwv8uHVbxNhJ38wsp
 d2DZE7iBYb3o2agVULUrDNzbmuZfmGyFHQA6APWug+p4u4NeelDkZ3pLHvGDjlxC7Yup5a2ZvTF
 OwtYnq8BtFqsThGs=
X-Received: by 2002:a1c:7418:0:b0:3a6:5e8:148b with SMTP id
 p24-20020a1c7418000000b003a605e8148bmr6024788wmc.128.1662741152997; 
 Fri, 09 Sep 2022 09:32:32 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7EU4bUUCBaDnY3Sf81ApM4DtsvWXnU+QZaYdFghfEV5aoT2a0pa6vHNVRTpAl2DDlMCyM/nw==
X-Received: by 2002:a1c:7418:0:b0:3a6:5e8:148b with SMTP id
 p24-20020a1c7418000000b003a605e8148bmr6024768wmc.128.1662741152692; 
 Fri, 09 Sep 2022 09:32:32 -0700 (PDT)
Received: from [192.168.0.121]
 (cpc76434-belc8-2-0-cust705.2-1.cable.virginm.net. [81.109.50.194])
 by smtp.gmail.com with ESMTPSA id
 m35-20020a05600c3b2300b003a845fa1edfsm237515wms.3.2022.09.09.09.32.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Sep 2022 09:32:31 -0700 (PDT)
Message-ID: <85f915c4-938c-8a23-a4c2-01fba0f87b63@redhat.com>
Date: Fri, 9 Sep 2022 18:32:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 6/7] .gitlab-ci.d/windows.yml: Unify the prerequisite
 packages
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <20220908132817.1831008-7-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220908132817.1831008-7-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.079, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 08/09/2022 15.28, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> At present the prerequisite packages for 64-bit and 32-bit builds
> are slightly different. Let's use the same packages for both.

Not sure whether that's a good idea ... I did that on purpose to save some 
few time during compilation (since the Windows jobs are running very long 
already) ... did you check whether it makes a difference in the run time now?

  Thomas



