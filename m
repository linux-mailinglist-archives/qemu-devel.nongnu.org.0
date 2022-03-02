Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9901C4CAD5C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:19:57 +0100 (CET)
Received: from localhost ([::1]:34972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTZs-0004xO-KF
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:19:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nPTM5-0001sK-Vt; Wed, 02 Mar 2022 13:05:42 -0500
Received: from [2a00:1450:4864:20::32f] (port=51943
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nPTM4-00071t-5F; Wed, 02 Mar 2022 13:05:41 -0500
Received: by mail-wm1-x32f.google.com with SMTP id p4so1667678wmg.1;
 Wed, 02 Mar 2022 10:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZRbxhyIo7QFTHQ0Q34LjrAc9g2/0XGiPG1hZAulHZkA=;
 b=hsJub/vGwEfrA+G2hsr8g+rc0AVpaF6aurLKrg51ROrT7ZnTPvYMKGJwl7zNZnSLv0
 Fy0VD/4Q5B9H3NZKhr394BjLy9IHTjBJvxUrGk2NMDR4PSElobsxqeORS6l+yz0ocvRd
 zLXKRmo6/lEGxmf0H8dTDhwAJ/cZSG39RNxVRCclUyGQx5+VqDHqt1iVP7BP1a1j7cyk
 uAhE7wiBghcwctCu6EqEi4MX4hXGQ92YmJlXHKPEUH1+lNSAGVWywHH9iO2XUsJ9ZN6f
 mqPYq3UUoeQnD3jBlUZkf6tQO7tItNAS95E0W+hDkXxeCZRTRgujysdQbtqT3rrdI0gN
 fcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZRbxhyIo7QFTHQ0Q34LjrAc9g2/0XGiPG1hZAulHZkA=;
 b=L0lut02y8yz0638w+2sojDyZDdd7F244khMNKmSDPIbhmTcj4SkAhEMi2o7bV3Lgu6
 HbkLR6s44FwzqU1szPJwEOk8GeuQyd59RlMe4yzO7b5UOs/36ezxGYSKCDRlIw5KtC7i
 VlLjitJHSsU+dlK1SzXMsjs6l5DVL9QrAoQqCROuyZQKoFjrn4smYBEQUkuuciGu3pJY
 Cl49wls97zh2FKXKsibgjyIqYr8gw2CtLOUQmnV5SNsmSZI9Bft6IwgbJ8leapSPsNwM
 bxccrs/SvF+IIXhOx1OauI2wCWeRo4Fl/eDCqFmPp/Sku4xG0nKVYiwrJqhHVwAWmQg0
 o+CA==
X-Gm-Message-State: AOAM530DoXGWCMH8/04V7JVVTF7/H3uCcdHuYqUwRmOlL3P0LMRApNpx
 U7ghPoluS2DOhel0ateZtmk=
X-Google-Smtp-Source: ABdhPJxpLP5NOJ701iz3X3Zgnf2XeBRUTyBosWZDM+/4BJvV/HwR2K/PeATNPdSUZ10EPcXLyzxvfg==
X-Received: by 2002:a05:600c:4e4a:b0:380:e40a:289 with SMTP id
 e10-20020a05600c4e4a00b00380e40a0289mr807471wmq.17.1646244337368; 
 Wed, 02 Mar 2022 10:05:37 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 g11-20020a5d554b000000b001f0326a23ddsm2813797wrw.70.2022.03.02.10.05.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 10:05:36 -0800 (PST)
Message-ID: <2976a926-9dbf-d955-166f-5677a06d9873@redhat.com>
Date: Wed, 2 Mar 2022 19:05:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] Allow building vhost-user in BSD
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, Sergio Lopez <slp@redhat.com>
References: <20220302113644.43717-1-slp@redhat.com>
 <20220302113644.43717-3-slp@redhat.com>
 <66b68bcc-8d7e-a5f7-5e6c-b2d20c26ab01@redhat.com>
 <8dfc9854-4d59-0759-88d0-d502ae7c552f@gmail.com>
 <20220302173009.26auqvy4t4rx74td@mhamilton>
 <85ed0856-308a-7774-a751-b20588f3d9cd@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <85ed0856-308a-7774-a751-b20588f3d9cd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 kvm@vger.kernel.org, John G Johnson <john.g.johnson@oracle.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, vgoyal@redhat.com,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/22 18:38, Philippe Mathieu-Daudé wrote:
> On 2/3/22 18:31, Sergio Lopez wrote:
>> On Wed, Mar 02, 2022 at 06:18:59PM +0100, Philippe Mathieu-Daudé wrote:
>>> On 2/3/22 18:10, Paolo Bonzini wrote:
>>>> On 3/2/22 12:36, Sergio Lopez wrote:
>>>>> With the possibility of using pipefd as a replacement on operating
>>>>> systems that doesn't support eventfd, vhost-user can also work on BSD
>>>>> systems.
>>>>>
>>>>> This change allows enabling vhost-user on BSD platforms too and
>>>>> makes libvhost_user (which still depends on eventfd) a linux-only
>>>>> feature.
>>>>>
>>>>> Signed-off-by: Sergio Lopez <slp@redhat.com>
>>>>
>>>> I would just check for !windows.
>>>
>>> What about Darwin / Haiku / Illumnos?
>>
>> It should work on every system providing pipe() or pipe2(), so I guess
>> Paolo's right, every platform except Windows. FWIW, I already tested
>> it with Darwin.
> 
> Wow, nice.
> 
> So maybe simply check for pipe/pipe2 rather than !windows?

What you really need is not pipes, but AF_UNIX.

Paolo

