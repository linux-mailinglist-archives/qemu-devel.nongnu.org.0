Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 926B857E152
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 14:11:46 +0200 (CEST)
Received: from localhost ([::1]:57906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oErVR-0004Hr-Oq
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 08:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oErOm-0003CN-Ai
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 08:04:52 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:35706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oErOk-0007g6-Dl
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 08:04:51 -0400
Received: by mail-ej1-x62e.google.com with SMTP id j22so8243414ejs.2
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 05:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D6yf3dRooHdt9eeyIKDBPdr+lxHZn2meTPyakwXqhkY=;
 b=jhvV3DnJFcWL0/UAtiDPgzqMAP3JNqDSbiF1HaTufWrDIxBUTEwPzZj5YvGRSb+ol2
 vDW2oBcR/wBDuy8VDryJ7u0uonuYrxfXZTX4EJ2VyU/T38zYkGx4DpqcpkMSx8PXnJa/
 TvM70Hl4szy8h76Di9Qu8WoTFQtZMEsarmSh55qlzF6DQgB6x6ZBg3wm8AmnbOjBZ9Cd
 jWbeVIXUXIKhNVbf7lrOSnL7FIsWiUSDtG/QoMjbovAdLvvXXNVdj3KwTHAUWjI4KrJI
 BFSjBxwN3UMuNwEM+yJlWuL35q1xd7oyiUtG1gJ4TGgmoWY/QZi+jHyHG8DiggD3D4CE
 8AoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D6yf3dRooHdt9eeyIKDBPdr+lxHZn2meTPyakwXqhkY=;
 b=0eL5Z1KyC2VO0Q1UQq1xUEwuQt82W5Hi6ieWVDwy1roQrjF5suwMCx9JdTym1t0aKW
 7M5SWnNZmzhCSKB4TT18+zkoJc/I5eyvBXk8xZPT8efcCvaYLhAI6l85RCPZfflccdd7
 dqb0JwNmCQ0fDAvlHKEXE9KjYFSs81JPs7i0G6lfneExVtkggqKKJqifDKnbyHaZ9E5t
 qhkgSTLHXLsL0E6eesM9O9j4lA9/Y20yPYjCptsmPuGY6Mk6J4ybeDS7vLzBzyBsIs/P
 vt+zIRjwX58kOZ2IqNkLwcR3BjDNpu1X0WGXEgWgYc8Wg2oQCN6e2IGpOxGn9KnBx7be
 QMZQ==
X-Gm-Message-State: AJIora+wSJAERG+myqSA8QX6MDHk/D8msuGd7LjTNvBOsTGrn+ZEI/Yc
 fIoYjS++3OJGA5bXmBmHjMk=
X-Google-Smtp-Source: AGRyM1vyxOc2mqKa2wq/c07rY/FJ1ogH0hS2F4737JSaurMLN2BZ6jnBxvLWlDf+BO4dlHG2tXI8nQ==
X-Received: by 2002:a17:907:7355:b0:72b:4a31:ba39 with SMTP id
 dq21-20020a170907735500b0072b4a31ba39mr218499ejc.490.1658491486766; 
 Fri, 22 Jul 2022 05:04:46 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 h12-20020a1709060f4c00b006ff0b457cdasm1931269ejj.53.2022.07.22.05.04.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 05:04:45 -0700 (PDT)
Message-ID: <f1ed5194-09dc-432a-666e-b834f4252f4e@redhat.com>
Date: Fri, 22 Jul 2022 14:04:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PULL 7/9] hw/guest-loader: pass random seed to fdt
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20220721163621.761513-1-pbonzini@redhat.com>
 <20220721163621.761513-8-pbonzini@redhat.com> <87tu7az28k.fsf@linaro.org>
 <Ytm1KiyFGNqAo/Af@zx2c4.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Ytm1KiyFGNqAo/Af@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 7/21/22 22:20, Jason A. Donenfeld wrote:
>> Why are we inserting this here? The guest-loader is only building on
>> what the machine type has already constructed which in the case of -M
>> virt for riscv and ARM already has code for this.
> 
> Wish you would have replied to the list patch before Paolo queued it.

Come on.

You posted a couple patches for this work 1 week before soft freeze 
(which is when maintainer trees should be ready for merge), so that some 
platforms get the support and some don't depending on how ready they 
are for the freeze itself.

Then you post the rest of the implementation on the day of the freeze. 
This patch has a pretty bad commit message too because any discussion on 
boot loader chaining belonged there.

Your own timing was completely off, and the right thing to do would have 
been to post a single series for all machines.  This way, even if the 
patches were to go via individual trees, maintainers could coordinate on 
which version to include, on how to handle migration, and so on.

Imagine doing the same thing for Linux, you'd be either ignored until 
the merge window ends, or alternatively shouted at.  Ignoring patches 
sent so close the soft freeze was my first instinct and it would have 
been the right call, except that in the meanwhile some architecture had 
their patches merged and here we are.

If anything _I_ have to apologize to Alex for picking up the patch in 
his stead, and for bending the soft freeze rules in an attempt to avoid 
having half-assed support where some architectures export the seed and 
some don't.  But you really have no standing to complain to him about 
not replying timely.

Thanks,

Paolo

