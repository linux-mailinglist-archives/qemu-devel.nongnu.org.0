Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C633189B4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 12:43:51 +0100 (CET)
Received: from localhost ([::1]:43578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAANy-0001LB-QY
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 06:43:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lAALJ-0008SH-8c
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 06:41:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lAALG-0000ZF-3y
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 06:41:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613043660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ehPO5DeRe1trQUSjietKJtuQmxZ0jCmZuPrBG34h3sI=;
 b=ZXJpMe8d7KLXY3iFlMEUkulWwpOFF69yRTPnKW0bq59Bi5dYswsXZOcl0P1D0YePukGGr0
 nVepwAHQYjAqPw4l3p/+qpn3Z1ucODKtOaAFWuaaDgvNeM+VgVRAUL5YRh0MxnyaaAzR7Z
 0gBsPAEqgc0DSeBQxKEb9wim439Pun4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-o-BmrkR1Ob6hSM3x8lPkVg-1; Thu, 11 Feb 2021 06:40:58 -0500
X-MC-Unique: o-BmrkR1Ob6hSM3x8lPkVg-1
Received: by mail-wr1-f70.google.com with SMTP id q5so2375528wrs.20
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 03:40:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ehPO5DeRe1trQUSjietKJtuQmxZ0jCmZuPrBG34h3sI=;
 b=K3ZvrgNFieuDSeD22G+s583S+gcJIG80vLlbdivExjNIhfbw3PS26BPk7bcYxufp+q
 ROxOfhuNVSgLN5dcB/Lq5P2nFn7jKF+QUaL+83tjFOse/FrkyAte878bGWsihZVLqlI6
 W9hDpGd8+Y39Qtcx5SX/209jfpIjrsfQiwX7itPx2YR51fbiFgvouHBs18LGLVvHpzqI
 8JDvduaay1yYdEPmte5CUp6O4ElTaMq9hpH0k1JdjQ8rFqXiIoyG873Tt4tO7PN6dPmu
 yb8Xdsfx34GAc8PIoytcKFSQ88aV+KTQU1xYQNJqCeniAqIDDzhgbV5a+QiZhVsPnTp6
 I4nA==
X-Gm-Message-State: AOAM5320JXyXLX54txE1oRulOsPpumSHjpgks6RfQaka5Chb24lCCWvA
 2PmH6WC+w+NpCHhr7got9kE8XHoh9eiku80gzcEMA/yZn+xp6QNhrOSz/vBhsQtHwg64MYpGbMk
 DHTo0nMphL5mYyqo=
X-Received: by 2002:adf:e3cd:: with SMTP id k13mr5122339wrm.289.1613043657421; 
 Thu, 11 Feb 2021 03:40:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOeoRdD4PmMFdAPr+KVIoD2IdXLd6LIL+NEv4MDWP56VEtcdB4itDAir2SpKBXzM4091JkRA==
X-Received: by 2002:adf:e3cd:: with SMTP id k13mr5122327wrm.289.1613043657262; 
 Thu, 11 Feb 2021 03:40:57 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n10sm4629856wro.39.2021.02.11.03.40.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 03:40:55 -0800 (PST)
Subject: Re: [PATCH] virtio: disable ioeventfd for record/replay
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
References: <161303249335.948571.16873882207700527766.stgit@pasha-ThinkPad-X280>
 <875z2zugai.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a4332285-fd36-7bba-a8b1-b5ba1c6432f4@redhat.com>
Date: Thu, 11 Feb 2021 12:40:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <875z2zugai.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.211, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/02/21 09:58, Alex Bennée wrote:
>> virtio devices support separate iothreads waiting for
>> events from file descriptors. These are asynchronous
>> events that can't be recorded and replayed, therefore
>> this patch disables ioeventfd for all devices when
>> record or replay is enabled.
> Does it always have to be the case? Can a virtio device forgo iothreads
> and poll events from the main loop?

Yes and in fact it's the default, but ioeventfd has the same issue I 
think even if the polling happens from the main thread.

Paolo


