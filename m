Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4809380361
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 07:33:34 +0200 (CEST)
Received: from localhost ([::1]:58190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhQS5-0000FT-Sq
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 01:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhQQL-0006h6-Ai
 for qemu-devel@nongnu.org; Fri, 14 May 2021 01:31:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhQQJ-0003mg-S9
 for qemu-devel@nongnu.org; Fri, 14 May 2021 01:31:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620970303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JhrpZfwAzi19jNSgrvDwd2liHAyKSNNcx7slbFTRhVg=;
 b=SkhvP4j/frLLj1ARZIbpbCNToHRdtEC/wEzk78FbGto5wQpJx6ww0rlwHz+lRzP1dtRZRz
 DR3ezPc1Ddber3rr1KUOEXSxIpmy0icBAdaS78UyEYxkAaO9crtte8gBqtmHTBrYNAR68O
 JcaaMar1LX2OgwHZuAsDZKpib2YfzIU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-J7-_p_FlMtm_pkuAKNEQQA-1; Fri, 14 May 2021 01:31:41 -0400
X-MC-Unique: J7-_p_FlMtm_pkuAKNEQQA-1
Received: by mail-ej1-f69.google.com with SMTP id
 16-20020a1709063010b029037417ca2d43so9178616ejz.5
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 22:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JhrpZfwAzi19jNSgrvDwd2liHAyKSNNcx7slbFTRhVg=;
 b=kmrMIOc4g2AK00sx0cOAWcnAngUW/pOP6kTZ6oXby2zBoN//qNleH4X83SmfhrE6tr
 vYTC7RznY5uIs/nV1B1UVRGFpHnnDmoXlU0IYUWPOE0QafRU/0ND+b2CDP8ZLbcAaV5k
 kSuXP5bPl+f4IgLlXEfoYDQEHSWFXLFJryV80jh6TRD4cMEad9vwUDRPaznyfck8WccM
 Watyhk7yDGTPF3OgxgGKyHJORlhdTq5gM4hCggNWntufUGxwGoUVdNemfkAlsUrkYAvz
 j0is6zUdhhruRg8fDyp+6GzjYJJTrFh9nbvvzPcUKyYvkFu/kFEl3Pouur2aC6zcvDIm
 E+Jw==
X-Gm-Message-State: AOAM531TiWpaBFYOoPrUjW080JDFgWQ1Q/g7I8mUuEvJCsHpTO7rQC7j
 POVy6Hsp/R9j6B9LpcZ3xozwKDY853jqaknFRuIf8Sc/rcn/WXqVrlDiOfvdG9ZbFwiYYji6smx
 FPrpDJYpearbR3eo=
X-Received: by 2002:a17:906:c211:: with SMTP id
 d17mr11743835ejz.247.1620970300286; 
 Thu, 13 May 2021 22:31:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVbNQVy7NFr8XvqpTCGjB+rrNxdZlv3EjrDlEr8wt0XGPT5THeSXH+snjUuzW4vqJI2XNe5A==
X-Received: by 2002:a17:906:c211:: with SMTP id
 d17mr11743819ejz.247.1620970300102; 
 Thu, 13 May 2021 22:31:40 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id p14sm1565262ejz.51.2021.05.13.22.31.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 22:31:39 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH] MAINTAINERS: convert to JSON
To: Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20190401112945.25592-1-pbonzini@redhat.com>
 <c75b2eb6-4127-61e3-20e0-b572de89668d@redhat.com>
 <e49b9ef9-2d01-7a0d-38a1-2891c52a4279@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <26449478-0553-64f1-2cd6-b0ac6ce97e38@redhat.com>
Date: Fri, 14 May 2021 07:31:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e49b9ef9-2d01-7a0d-38a1-2891c52a4279@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Matteo Croce <mcroce@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/05/21 23:02, Willian Rampazzo wrote:
> I think I understand why you brought this thread back now. Finding a way 
> to correlate maintainers and tags is, indeed, a nice feature that can 
> help with your idea about correlating tags and maintainers to use on tests.

--verbose? :)

Paolo


