Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 884393D0836
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 07:25:43 +0200 (CEST)
Received: from localhost ([::1]:49112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m64jm-0000uY-48
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 01:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m64iK-0000BF-Gx
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 01:24:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m64iG-0007X3-Vx
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 01:24:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626845046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7u9IAqMaH37yd4oGs+wz9ZOLTTuYZzgQAu9vCX2G8v4=;
 b=JDlpT/7jXXcxm9IC0g65xEmcmY+GNUiWDSXpVOPKbLCdFF6mpkdOKDTpGuA5fWkGf3Jzbh
 u4wvifFAVqtwnG/tcJVThQgO8dSPrq4CqSOrBg2Wm//nL7uHHElpSLG6TzAfyLlXClwQaO
 YFE7nJlL012g+xbsT55fPIRa6076BvQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-8ARLLMleP0SZVgMxT725vw-1; Wed, 21 Jul 2021 01:24:05 -0400
X-MC-Unique: 8ARLLMleP0SZVgMxT725vw-1
Received: by mail-wr1-f69.google.com with SMTP id
 m4-20020adffa040000b02901404c442853so432362wrr.12
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 22:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7u9IAqMaH37yd4oGs+wz9ZOLTTuYZzgQAu9vCX2G8v4=;
 b=aJWoGsSLfhrL53DlZtGmDJF3IwMu1A/e1EIaEGxqqQw/CWNBvB364oTveGQtCpUNJW
 Tms5JFjvg8uYvpCTwo3UvdQqCNT/neCua7Cxjmgv4oSvsZnKBXzKLveSvVEHzqBZmo2I
 cv85331L4QtvuQgouGZIpd/6Z024PyI2hSFC3QcLNqLczXtRrvLjzCFsDUvQwnIK/9AX
 CLvDZ2z1TP1mwJ7huEXFPqhOOiX6kkai6xRy6rlIN1WmC4qC5Y7zDYWwtztcUjMQhnld
 ec6spAwwqAGEwvPLpv62uXJna1Ws/4ubKToABkBWEwTmuBgPGeEiolblBPnKOu7YIeNX
 YKHA==
X-Gm-Message-State: AOAM530k7YnwSzmF83XYgkihOzrg9Z0i1+t49OpbAdp7qwnvvipt45OC
 CCtDCb0E74JY1qeOeLnDUbRANiH43DAh6Z6uaa1lYQE17MRkRcvL5S4nnvD5tU+pfylaSkDHnN0
 iVelGrMo4zsiLC1w=
X-Received: by 2002:a5d:4b0f:: with SMTP id v15mr21434549wrq.377.1626845044053; 
 Tue, 20 Jul 2021 22:24:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZElNHFriimsbmdRiBg8jDx9/t55phDmRbJifsUbnwRL2S50gTAAahADqLcHlWvL6c4cKrew==
X-Received: by 2002:a5d:4b0f:: with SMTP id v15mr21434530wrq.377.1626845043837; 
 Tue, 20 Jul 2021 22:24:03 -0700 (PDT)
Received: from thuth.remote.csb (p5791dad8.dip0.t-ipconnect.de.
 [87.145.218.216])
 by smtp.gmail.com with ESMTPSA id y6sm21146926wma.48.2021.07.20.22.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 22:24:03 -0700 (PDT)
Subject: Re: [PATCH 0/1]
To: "Jose R. Ziviani" <jziviani@suse.de>, qemu-devel@nongnu.org
References: <20210720221351.13354-1-jziviani@suse.de>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <ce1bda4a-e9e8-ec43-31ef-9ef3a58a16c1@redhat.com>
Date: Wed, 21 Jul 2021 07:24:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210720221351.13354-1-jziviani@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUBJ_ALL_CAPS=0.5 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, kraxel@redhat.com,
 cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/07/2021 00.13, Jose R. Ziviani wrote:
> Hello!
> 
> This patch gives the ability to build TCG builtin even if
> --enable-modules is selected. This is useful to have a base
> QEMU with TCG native product but still using the benefits of
> modules.

Could you please elaborate why this is required? Did you see a performance 
improvement? Or is there another problem?

  Thomas


