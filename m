Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 210DB44D7C4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:03:17 +0100 (CET)
Received: from localhost ([::1]:57536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlAfc-0007DS-8g
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:03:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mlAej-0006Ye-Fr
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:02:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mlAeg-0004vC-QV
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:02:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636639337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rpFSsu/u9GrPqEySvl/pM1MI6voHMPa2qMYxs4Ut1oU=;
 b=dupMJEWvZLx0P6NgWl828fj/qwtlrKHt6kv1HVJic5EEeeQ50Y+Pv3OoGYo9jigD8bBzpA
 b9cjrm2NhhSw+SDahF2nPkbBn24F0GJMRwVbg3peet8zmQMEsl1vkVqFr+5/o1vujaHxlZ
 Im+hIHXsPbcWYzdk4pFARHSRbgwBuOM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-S2vdfSf1OTW8p6qO4qzEKg-1; Thu, 11 Nov 2021 09:02:15 -0500
X-MC-Unique: S2vdfSf1OTW8p6qO4qzEKg-1
Received: by mail-wm1-f70.google.com with SMTP id
 145-20020a1c0197000000b0032efc3eb9bcso4862058wmb.0
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 06:02:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rpFSsu/u9GrPqEySvl/pM1MI6voHMPa2qMYxs4Ut1oU=;
 b=u9aTeNs13XRbo5a+vctOdDEUl37dNl+YHyQ5xJLCuRDDtq4kZo1iHhfQC7hfWDkh+N
 WkvSb5/XtxH11JFRAxB0NXhumcxauYoq65DkXEjHMG44Dw+cEKK1BZDXlndVGquFLGCG
 lv4jcJnFHgy9tRBOmM32hcJnAJmK7AttoV7uSqVneD5ezQvctGbXW1lWbuHsCcevsxoR
 knpAfiX9kIt4lsaWFUbowXtPnWdRR4U7xmXSbdDwL1KlHEPZk3xZBYWdnU6fr3NAozmb
 g0rceHsJofLcRFEVGCk8MKyC9G8FDv4eDmfKk9O50NBKxRSuYLSCDiJlzW6THUvtSYKV
 cNFA==
X-Gm-Message-State: AOAM533mv95vKSPexND/e3O2z2Bc7MgjyuZsSEIOEEPDYZ2nriDJFsHl
 0XVMYc2rXgG8kixz8TmkLj+ZC4XjSDurZn5SK6Ef4Wsc84D+tdHmLX7EZdm+UTPrY8MuipW9CER
 LoSAUdVPN85gLB2I=
X-Received: by 2002:a7b:c08a:: with SMTP id r10mr8388420wmh.184.1636639332698; 
 Thu, 11 Nov 2021 06:02:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOfyStP61JPX28Jachii+2PURtm92BbQ1QYwLiksNFKzvOJbtoFx7oMpB5uDvqjYI2ei7hog==
X-Received: by 2002:a7b:c08a:: with SMTP id r10mr8388171wmh.184.1636639331001; 
 Thu, 11 Nov 2021 06:02:11 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id z6sm3042127wrm.93.2021.11.11.06.02.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 06:02:10 -0800 (PST)
Message-ID: <200906c9-7681-a55f-f4c1-bbf1c750d254@redhat.com>
Date: Thu, 11 Nov 2021 15:02:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] target/i386: sgx: mark device not user creatable
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211109175021.17813-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211109175021.17813-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.999, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/21 18:50, Paolo Bonzini wrote:
> The device is created by the machine based on the sgx-epc property.
> It should not be created by users.
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/i386/sgx-epc.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


