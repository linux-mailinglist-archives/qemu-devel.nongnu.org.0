Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 384294016A1
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 08:53:57 +0200 (CEST)
Received: from localhost ([::1]:33156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mN8Vw-0007ow-7K
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 02:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mN8Td-0005p8-A9
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 02:51:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mN8TX-0000iv-5e
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 02:51:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630911075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a5OtTIJAF0X8uKPI1sqOz2T74h43+nVGzrNXOgkW24c=;
 b=YCrhfGE5VoDevHIegIl4fXKTVE6g4QG61o6Eflr2u2T3kcAX4N2HzQyTv82PiFtORfsDX3
 /79ltSbQ2u/OVi76odldDs/vVyIQ/EKixmD0ILxLDQO5LUUgRzTGPre6qgewMnrXEaoWyR
 vhhBoDm3fku2UBlsHuuctLpZHpl1tNA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-Np2iGnPAOeiTf3wJNghzcA-1; Mon, 06 Sep 2021 02:51:13 -0400
X-MC-Unique: Np2iGnPAOeiTf3wJNghzcA-1
Received: by mail-ed1-f69.google.com with SMTP id
 y21-20020a056402359500b003cd0257fc7fso3201759edc.10
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 23:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a5OtTIJAF0X8uKPI1sqOz2T74h43+nVGzrNXOgkW24c=;
 b=MMx8KOC6uuln6gaFfLkF9aXIkVMoHRPPZHeF+1RfyMTWEsbbo7sG6Vf+bRqX/1+wjp
 dK+Rr30LLExHoBmWHxcVjeu7Cl60B/3yhuP8g1tNMcicLiN4qVzkTN+4/DV358e1Nh2h
 M4GXY6pl31LPt/PB/MDWxQ9UAD5qkpbwXnypgelSaxO4hW8w5Vz6ZouZfU+PqVjIQ8ex
 N/YjrmtcHrJcEjblGkaj1RqHJf0baXjGKoUISRBpH39ihiuAajGOZH6pfSnQHbojy+9t
 +Wo1fHK1V+UJEy/urWSbPUco0a29bC4px1dB/ZKSWO+NlEpVPq2F8T2EpwigGm2bdoWb
 fksQ==
X-Gm-Message-State: AOAM5327iYAXANxQZ26DmKSXGhtKbduswFA88tYN0jxc4UiRo9e73pU2
 PFdC1A0EST7uONQb6gH1tMT2qpfIkAivaHkUsoKEP+qD89GCqC28ZCtmfiQII9nI4xmMkNjLRWd
 nREJpovk4bkhfaps=
X-Received: by 2002:a50:ab42:: with SMTP id t2mr12116062edc.113.1630911072863; 
 Sun, 05 Sep 2021 23:51:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqr8QAiYarq939Lbxzude1H+jt1uceRHgEY8uTDmKJbhojxNU8OVmJsoYiZblFkSAcHk6oKw==
X-Received: by 2002:a50:ab42:: with SMTP id t2mr12116053edc.113.1630911072723; 
 Sun, 05 Sep 2021 23:51:12 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q9sm3326913ejf.70.2021.09.05.23.51.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Sep 2021 23:51:11 -0700 (PDT)
Subject: Re: [PATCH] softmmu/memory: Validate {read,write}_with_attrs before
 calling
To: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bmeng.cn@gmail.com>
References: <20210905154049.7992-1-bmeng.cn@gmail.com>
 <CAFEAcA8frUy2wmQjj=Bk_GGT9O=qHzb5pjSFupc7SaEyDUvYZg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8da074de-7dff-6505-5180-720cf2f47c70@redhat.com>
Date: Mon, 6 Sep 2021 08:51:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8frUy2wmQjj=Bk_GGT9O=qHzb5pjSFupc7SaEyDUvYZg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.832, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, P J P <pjp@fedoraproject.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/09/21 18:29, Peter Maydell wrote:
> Last time this came up, we discussed the other option, which
> is to have memory_region_init assert that the MemoryRegionOps
> defines at least one valid read and one valid write pointer,
> so that these bugs get caught quickly rather than only if the
> guest accesses the device in the wrong way. I tend to think
> that that is better

I agree, and Prasad had even posted a patch for that, but it failed some 
qtests and I ended up never checking why that was.

Paolo


