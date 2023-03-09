Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFB26B1EC1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 09:52:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paC0H-0008V5-1P; Thu, 09 Mar 2023 03:52:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1paC02-0008Pj-BS
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:51:47 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1paBzz-0002CH-Qo
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:51:46 -0500
Received: by mail-pl1-x632.google.com with SMTP id y11so1285074plg.1
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 00:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678351901;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IoLKXeFqXx7KD6iGKmnIOLpPoXbmwYAjlvz4PZEVkSA=;
 b=oI8i8uA/fJ4fx70BP01mQaO1LIeI5Vx3YvB8invcNYwm1oxVme9UEM2+bpZ0C8DltH
 Tmk532tfIlDCJq3ERFUJ5Fr0WFLdOODZ8C8uUs0oHvU7HP44xRE/CWLpdI3qZ/sY+RBo
 0oWINPG2tk2PsX/Qf+08gh/1hnJ0D3oSNZJ8C/yKCCiCQIo/x4NySCgmw0D+aFokkEh5
 Un1/MdTbafvIumV3W1L6SF3RlqTnZ6SbJtk+2fxDOsGv2V7/ojSEtrGDB68zg9hH83ew
 JPsKkHJI6Fc/FNa7cXlcqWIQ5FhzS2D7lN5ALpreItij+kFLQUrHftGBw5K9hEAV1Fm/
 1Rnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678351901;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IoLKXeFqXx7KD6iGKmnIOLpPoXbmwYAjlvz4PZEVkSA=;
 b=8Dk8+T/6X9FO2hzciLeL8ys/LezTr3mNHKOqosA/vOCMxG1F7Pu5cEAf9ri0bZ7znD
 A+iCPCsTueSb+SJEQ6onvs4sJk47ZIOGLffvTgIKBTaWattARp7zQw7o9L7nN60YyTuT
 UzTF3KWu5WroxKBfk2FWiHHvOQRwfSnMhg0r7S6bnkGECPrK6YgqMPBSo4VaWzlYl4tH
 IkDRffrI0gwYHcUsvUCY71U4F/oWaGDDjpUu7ecol3Om2NLwgxoMNzay9kYr4C7hUj9l
 qSxgJAZLWNyfmsB+gpOZ78TtIqhxsOjz7SjZdR/ge8qR/B4AKySy42W5HY80QU2aAv+X
 WHbA==
X-Gm-Message-State: AO0yUKULcgMOxPdCQqgozwfAfHWot/IEoR4//EWnYnSA4iTKnE+SR3E/
 SgYrfNKFmmzo32nRgFS5VBHl/g==
X-Google-Smtp-Source: AK7set+XV8TLjm8RgYTqNTMsI0CUUR3mMd7SAtAvTG0E9Jgb0eD9NpjnCNEhIm4iXn1YYGJQOpSeoQ==
X-Received: by 2002:a17:902:e80f:b0:19e:747e:813e with SMTP id
 u15-20020a170902e80f00b0019e747e813emr23672384plg.23.1678351901368; 
 Thu, 09 Mar 2023 00:51:41 -0800 (PST)
Received: from localhost ([122.172.83.155]) by smtp.gmail.com with ESMTPSA id
 h4-20020a170902f54400b0019a6cce205bsm11133655plf.154.2023.03.09.00.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 00:51:40 -0800 (PST)
Date: Thu, 9 Mar 2023 14:21:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Liu Jiang <gerry@linux.alibaba.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH V2] docs: vhost-user: Add Xen specific memory mapping
 support
Message-ID: <20230309085138.jsn5qwlwvtbtjszv@vireshk-i7>
References: <7c3c120bcf2cf023e873800fd3f55239dd302e38.1678100850.git.viresh.kumar@linaro.org>
 <20230306153451.GB51288@fedora>
 <20230307054336.uvky5d7q2qqlxdcv@vireshk-i7>
 <20230307162237.GI124259@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307162237.GI124259@fedora>
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pl1-x632.google.com
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

On 07-03-23, 11:22, Stefan Hajnoczi wrote:
> VHOST_USER_IOTLB_MSG probably isn't necessary because address
> translation is not required. It will also reduce performance by adding
> extra communication.
> 
> Instead, you could change the 1 memory region : 1 mmap relationship that
> existing non-Xen vhost-user back-end implementations have. In Xen
> vhost-user back-ends, the memory region details (including the file
> descriptor and Xen domain id) would be stashed away in back-end when the
> front-end adds memory regions. No mmap would be performed upon
> VHOST_USER_ADD_MEM_REG or VHOST_USER_SET_MEM_TABLE.
> 
> Whenever the back-end needs to do DMA, it looks up the memory region and
> performs the mmap + Xen-specific calls:
> - A long-lived mmap of the vring is set up when
>   VHOST_USER_SET_VRING_ENABLE is received.
> - Short-lived mmaps of the indirect descriptors and memory pointed to by
>   the descriptors is set up by the virtqueue processing code.
> 
> Does this sound workable to you?

Sounds good. I have sent a proposal (v3) based on that now.

-- 
viresh

