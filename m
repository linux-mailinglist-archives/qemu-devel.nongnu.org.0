Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4473D25F7
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 16:41:15 +0200 (CEST)
Received: from localhost ([::1]:56466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Zsw-0007Ez-5o
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 10:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m6ZrI-0005qM-Ru
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 10:39:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m6ZrH-0007Mw-Gj
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 10:39:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626964770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lcJAociuKRKxP/QXHqrNsCWvdYhrawuob/ve/LjJZ3U=;
 b=AmwPLhlYmf9N7QUpey4nDs58T21zR62rJwcP62bZMSCyiXAysQu56BVq2dMQO/SBI73tKW
 wVTtIosw/sZvcxyefCXl6vORbDdfdv+F3nDe0mQAIxmO1lXH4DyC09PtJR46Zyw51i5ILF
 7mMEzOHscG5/zmIPIHHrfCK6rfvlgn0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-5yTaLyadMwmk2ku_d5OJYA-1; Thu, 22 Jul 2021 10:39:29 -0400
X-MC-Unique: 5yTaLyadMwmk2ku_d5OJYA-1
Received: by mail-ej1-f69.google.com with SMTP id
 i13-20020a1709061ccdb02905478dfedcafso1864180ejh.21
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 07:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lcJAociuKRKxP/QXHqrNsCWvdYhrawuob/ve/LjJZ3U=;
 b=TAkT9+PBDYqhXNgcHdChlPw6tZG/CSt0Voo4BsrmjyjRfmUA1h4e8j0UvrundytB19
 jyu10OQO6wYURKdl3bbE34NK/8XCA+sSOWKyrMDqfBlbNLgaFIQOncaoc8wTsO5XPjdz
 ApoAKleTxwe8qv15VYq4DmDWtSLLosngoPEI9zPw6M1YpKgmWsSMVJFdmNiJUUDW/FJT
 Ro4DWcHj8s9G0B5rCCf++kHQxMF/F5CYFWO0XYUDWT6WvFVsmVvW64h/VX0r2BZPnHEP
 8ct0o0yrNc1krqMB9CysRtXeYhUTXWnusFRCLdF7qcHnKbOInnKLh9K9BLPfjlLkPOMH
 0bdQ==
X-Gm-Message-State: AOAM530inZHZLIHulVY6ocuJhp05/xJX8WgIdcLO4k1C/okrP5cXgR+D
 qflkFpz+RpLNLrwZx3K5MXw5Lm2jci/uKaAk0t7fRSSmxI3i0IHbMwtUFx2rpbGhRKDMXnH1Uw4
 tf+XH5//xhTGql4hiq8HoTxEgDQZ8xfmXyn7f9QvzWa8dw0lj8qfj4CBYAIchQoEZC94=
X-Received: by 2002:a17:907:7695:: with SMTP id
 jv21mr201591ejc.243.1626964768083; 
 Thu, 22 Jul 2021 07:39:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwedXT2wsnpgisfEajN1VCGPjPDemAArIckjS61Ll/SiQf4WJ3MMKjjlGSOvqegd1zjOq7y4A==
X-Received: by 2002:a17:907:7695:: with SMTP id
 jv21mr201575ejc.243.1626964767886; 
 Thu, 22 Jul 2021 07:39:27 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v16sm11929057edc.52.2021.07.22.07.39.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 07:39:27 -0700 (PDT)
Subject: Re: [PULL 36/40] vl: switch -M parsing to keyval
To: Peter Krempa <pkrempa@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
 <20210706100141.303960-37-pbonzini@redhat.com>
 <YPkp+PF8kUyK9sy+@angien.pipo.sk>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <793420c5-ee1a-cf75-2bb6-cb84c9fdb2de@redhat.com>
Date: Thu, 22 Jul 2021 16:39:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPkp+PF8kUyK9sy+@angien.pipo.sk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: libvir-list@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/07/21 10:19, Peter Krempa wrote:
> This patch breaks detection of certain machine options features in
> libvirt which were being detected from 'query-command-line-options'.
> 
> I presume the change simply removed this from the output of
> query-command-line-options due to the historical cruft how the
> aforementioned command works.
> 
> Unfortunately I didn't find any suitable replacement from what we are
> querying.

Yep, there is already a patch queued for this.

Paolo


