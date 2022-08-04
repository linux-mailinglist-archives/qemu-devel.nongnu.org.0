Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AE4589B2B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 13:45:19 +0200 (CEST)
Received: from localhost ([::1]:49592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJZHx-00073L-Ps
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 07:45:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oJZG9-0004yF-FN
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 07:43:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oJZG4-0002ZI-RJ
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 07:43:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659613399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qLg6xPzoLSCph8BKBP/kRAFyl8BQsbzXXR2ijAxSTQU=;
 b=W9KkML1fKanwrGgHysBfStjQ8pLAgbv/L+m5gkWbzoYbC5tJp93LCpcG7cXs5XPkK0BPpU
 vlYDQKvPODcFkiBCqqzIi90xhK2uyZ44uR46fvDgG0J3p49Uq+UhU2OJ8Ua5LhUtUPwz5V
 DEBfTRp6MMBe5OKqhZjP4736Yx6PZ+c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-G7O_fIgKPLOaNtZnYSbaIg-1; Thu, 04 Aug 2022 07:43:18 -0400
X-MC-Unique: G7O_fIgKPLOaNtZnYSbaIg-1
Received: by mail-wr1-f70.google.com with SMTP id
 c7-20020adfc6c7000000b0021db3d6961bso4774371wrh.23
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 04:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=qLg6xPzoLSCph8BKBP/kRAFyl8BQsbzXXR2ijAxSTQU=;
 b=HSSf9bWYYF6ffI0bu0Mn17q/lvhYQ2/1hnc3TKag4RuIyjquBbfIKTMTy1kJBbbelU
 SAGjM7WhGPj2miQdZX3bsG9/MY9f+KLFnWJi6RPytXjIQsrIBL71an16xusbAvbCtnA5
 41L/0U0ZVx2RrNPJBYEQxoLUvFZa62ukayxWnhn7zQGsKZwsCeH/rvmR9gwPzOWIukPh
 ufmRVOY8gQI2fBa92twtPZIU2r5d34y46pufiU4OM15KhqKaRSAVZh4f+2cylWaVqsGn
 R6uczKJCluhfPnTud3yG9j6cFtAjyjXH9d42TM5d1GHMaBtRTcVd5qDD2UEqRANT+2It
 d/6Q==
X-Gm-Message-State: ACgBeo09wJ2mRlBqDrycz3fiVBq3JMwf5YiWORCHqunl8dA/esTweUHj
 P4TKufVBEc3U1290U58MncraWs2EtBCIR9VyLT1cn698zOi+EVYtqP5YV9uOWOIxTvO1ne54Pv/
 uwaERwv1OT+/2T/s=
X-Received: by 2002:a05:6000:1447:b0:21d:c92f:99d3 with SMTP id
 v7-20020a056000144700b0021dc92f99d3mr1125998wrx.503.1659613396677; 
 Thu, 04 Aug 2022 04:43:16 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7EWcQnjcXRYehD8hbWhq37X1ZA969NjCVhv9HVgBcDhK7WI87pxQKxJF8d75og+pAc3CrATg==
X-Received: by 2002:a05:6000:1447:b0:21d:c92f:99d3 with SMTP id
 v7-20020a056000144700b0021dc92f99d3mr1125988wrx.503.1659613396447; 
 Thu, 04 Aug 2022 04:43:16 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-42-112-229.web.vodafone.de.
 [109.42.112.229]) by smtp.gmail.com with ESMTPSA id
 b4-20020adff904000000b0021e9fafa601sm883420wrr.22.2022.08.04.04.43.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 04:43:15 -0700 (PDT)
Message-ID: <d2c8abec-1f87-01e5-a882-8502d9547f39@redhat.com>
Date: Thu, 4 Aug 2022 13:43:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 mcascell@redhat.com, f4bug@amsat.org
References: <20220802134834.454749-1-thuth@redhat.com>
 <CAFEAcA_oZni8G7LeciOywasY2rcEnpo=v01xCaaCTBp5_pDTLQ@mail.gmail.com>
 <aaa3210f-0c81-5c4e-7757-10fa99f5ac27@redhat.com>
 <CAFEAcA8Nsa131yeONs7-3H4wq885r1yuCwwSs=O09SS_Q7xUdQ@mail.gmail.com>
 <d3880c4d-b100-b412-e1f1-4f5c650cc22d@redhat.com>
 <CAFEAcA9azLEWsK-ewXT_ovsc2u+2ykMMJNK8b9UXdfBZ49w6eA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] hw/usb/hcd-xhci: Fix endless loop in case the DMA access
 fails (CVE-2020-14394)
In-Reply-To: <CAFEAcA9azLEWsK-ewXT_ovsc2u+2ykMMJNK8b9UXdfBZ49w6eA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 04/08/2022 12.17, Peter Maydell wrote:
> On Thu, 4 Aug 2022 at 11:07, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 04/08/2022 10.56, Peter Maydell wrote:
>>> But the point of TRB_LINK_LIMIT is that regardless of what the
>>> contents of the TRBs are, the loop is not supposed to
>>> be able to continue for more than TRB_LINK_LIMIT iterations,
>>> ie 32 times. In this example case, do we stop after 32 TRBs
>>> (case 2) or not (case 1)?
>>
>> Oh, wait, I think we were maybe looking at different spots. The problem
>> likely does not occur in the xhci_ring_fetch() function
>> (which you were likely looking at), but only in the xhci_ring_chain_length()
>> function (which I was looking at)!
>> xhci_ring_chain_length() can certainly continue more than 32 times. In
>> xhci_ring_chain_length() the TRB_LINK_LIMIT only applies if "type ==
>> TR_LINK", but the TRBs we're talking about here are *not* of type TR_LINK.
> 
> That sounds like we do still have an unbounded-loop problem,
> then: there's no limit on the number of consecutive TRBs
> we try to read in that function. Maybe we're missing an
> error check of some kind (does the spec limit how many
> consecutive TRBs there can be somehow?) or else we need
> another artificial limit.

I'm not an XHCI expert at all, but while at least having a quick glance at 
the spec, I did not see any limit there. So I assume that we should enforce 
an artificial limit? What would be a good value for this? Gerd, do you maybe 
have any opinion?

  Thomas


