Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1FB3E2393
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 08:54:05 +0200 (CEST)
Received: from localhost ([::1]:44206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBtk4-0008RR-O6
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 02:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBtiB-0007gT-EI
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 02:52:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBtiA-0006hz-0E
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 02:52:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628232725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RcetMlfF8wB8j63sPy93cPs9QcW5xwAddAg+fvztwIA=;
 b=XDDwl7iVpqSwQmPX7LP48jGaupwhr7qCX80oeajEuZ+8ErPYPUBkQzdUdOhNVQyt/NEa9V
 PlTiopIOpzKSb0A/HvNyT+LwmWdsaHc/usbieVaIG95CZJQj7XsyFPkurwPGVZRJbnE3V+
 ULgQsa8rLGbC2d61HeAZ86b++/hibYU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-MqlPykEEMPCczNtb8ug4WQ-1; Fri, 06 Aug 2021 02:52:04 -0400
X-MC-Unique: MqlPykEEMPCczNtb8ug4WQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 o4-20020a5d47c40000b0290154ad228388so2799906wrc.9
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 23:52:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=RcetMlfF8wB8j63sPy93cPs9QcW5xwAddAg+fvztwIA=;
 b=i7e9EpL24cWpBQpvRsEulyYUwYlwyj66MnkISORigQm8z3xyQiXYloDOzZ/ylDOC79
 fea3cMXAYpP3uYDH0UagWq+VfSorAVmz31LMBOD+RaNq5gLCTobhriY2QX34SmKug9FW
 zuW0W7llhwjirMRuH7MDpPgo1waEvMxj51aioYeMkdwVJPZwEB11gLNKKXWzWE/8pQJi
 ZgUJIC8Em/1xrjC0ITczBmkcYggztXj46g6sL4BU8IxSaWhH+yuy1Y73+V2ngfJNZcZ+
 kaqOKMHMiGi0MMrovgqGS7ONp1Cuj9o5HXa1LC4WhRiVEQTSN2UAysLyW+jTQHo02ly4
 tAQA==
X-Gm-Message-State: AOAM532N6YvaMM29pEvNam76HOtrXEO6jBilB64/KeYtfr2EpzFq7SvS
 qyS3/KwqjsfTPQLrjMNrL4cLDoUEG2cfsEYNzVbd050aqmyAqu0Edi153MbgqvwgXdkDgiIFnb9
 7T2JzankkK21KHM8=
X-Received: by 2002:a05:600c:4f15:: with SMTP id
 l21mr1594858wmq.171.1628232723173; 
 Thu, 05 Aug 2021 23:52:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaGYNNV3lvAYBlnMVBrFCmqT/YJvoDQF2Y84OeztkcwMva2Xjp85QkJn3SBtdntyHJldcY4g==
X-Received: by 2002:a05:600c:4f15:: with SMTP id
 l21mr1594846wmq.171.1628232723038; 
 Thu, 05 Aug 2021 23:52:03 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6104.dip0.t-ipconnect.de. [91.12.97.4])
 by smtp.gmail.com with ESMTPSA id p2sm8748900wrr.21.2021.08.05.23.52.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 23:52:02 -0700 (PDT)
Subject: Re: [PATCH v1 03/12] s390x/tcg: convert real to absolute address for
 RRBE, SSKE and ISKE
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210805152804.100333-1-david@redhat.com>
 <20210805152804.100333-4-david@redhat.com>
 <33c1f057-fd79-d15f-e8d5-2d261fbd1255@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <c5a589ad-f3ee-b0fe-1bcd-318989e3a23a@redhat.com>
Date: Fri, 6 Aug 2021 08:52:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <33c1f057-fd79-d15f-e8d5-2d261fbd1255@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> 
> According to the PoP:
> 
> "When the enhanced-DAT facility 1 is not installed, or
>    when the facility is installed but the multiple-block
>    control is zero, general register R 2 contains a real
>    address. When the enhanced-DAT facility 1 is
>    installed and the multiple-block control is one, gen-
>    eral register R 2 contains an absolute address."
> 
> Don't we have to take that into consideration here, too?

We don't support EDAT1 a.k.a. huge pages yet. If we ever do, we have to 
further extend this code.

Thanks!

-- 
Thanks,

David / dhildenb


