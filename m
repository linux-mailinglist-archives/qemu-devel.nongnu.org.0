Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D1641999D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 18:48:48 +0200 (CEST)
Received: from localhost ([::1]:47896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUto7-0006Or-DK
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 12:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUtep-0004Rx-Ty
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:39:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUtel-0008UM-Nb
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:39:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632760746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=842ttx2eiP4k+Ve89/RnXT8vPbb1BnfAo3nYKnDK6R8=;
 b=blWfsneHJABiZuso+5HhEATdnmYj2J1I3MYdmPPGa+JW23vpvV9/NIRCnnLxNgHdZnA2A4
 M2n7mazf7YC08+NEbMSYCWIQXXbbWL2UBNPjOs87ORPTXlbc3eoQyXcim0k7tiWIlu2NM5
 iykVryXIscOndk3B1/A4JlRYK2jqiis=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-PzWB_KsSOvyUB7nSMkPdrg-1; Mon, 27 Sep 2021 12:39:04 -0400
X-MC-Unique: PzWB_KsSOvyUB7nSMkPdrg-1
Received: by mail-wr1-f69.google.com with SMTP id
 e12-20020a056000178c00b001606927de88so1213968wrg.10
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 09:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=842ttx2eiP4k+Ve89/RnXT8vPbb1BnfAo3nYKnDK6R8=;
 b=XrytBfM8xXevKBIBlrcqGAckmGFzJCvGvHCJxZc6aGTrOmf7IoE8nKbUnArcHX9I6E
 z3HZ9FJRMMqf7vjSVNlBOKWoegUBiAIrhEBQ8mbjc11uxP+rJNtFLynUWWw2+yhsmxux
 PumXXUIuONaw77b3xCRcNWrWbM+cco32OZxeHxEAGed0T86QTaxvL/B/nIOoaz6qILFc
 SrkgfGUL3XQkhfuaEvqAaX1+5/F1uXXIO/40xtyr/f9+otqEFl0+vjUL2WT13PWNRJCx
 RNc6GG87+TOxZLhxv/qiuD2LfLxTdfOeEMNqGDGKcdMnpgX14ruhnVtLUuvOYzPsTGQ7
 te5Q==
X-Gm-Message-State: AOAM532TdKRPHdmzVz3R+tKfymepIRPqt8BtkPwRYkHpupQkrp8Sf39d
 7WCUh0bOOoQ+Ba733EuWcFEAfeUFda7clHdWwK9pBeUNQ06J6VjSFKxrZVuR0+a17lR/TXyEXd/
 0jJqITDGyiwJXwNU=
X-Received: by 2002:a1c:3584:: with SMTP id c126mr49227wma.0.1632760743768;
 Mon, 27 Sep 2021 09:39:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXnUC8in7uEISgXzbiyrWMVtXIRg/iXIy+76Fq6jn0dcuNWvM8JPw7LrVRMct13atX7ZncgA==
X-Received: by 2002:a1c:3584:: with SMTP id c126mr49209wma.0.1632760743566;
 Mon, 27 Sep 2021 09:39:03 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id o11sm26662wmh.11.2021.09.27.09.39.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 09:39:03 -0700 (PDT)
Message-ID: <13fa5435-8a4b-a90d-b86b-15e1cc55077b@redhat.com>
Date: Mon, 27 Sep 2021 18:39:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] Acceptance tests: add myself as a reviewer for the
 acceptance tests.
To: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org
References: <20210809192907.42138-1-willianr@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210809192907.42138-1-willianr@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.136, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/9/21 21:29, Willian Rampazzo wrote:
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 37b1a8e442..3f8ad63165 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3422,6 +3422,7 @@ W: https://trello.com/b/6Qi1pxVn/avocado-qemu
>  R: Cleber Rosa <crosa@redhat.com>
>  R: Philippe Mathieu-Daudé <philmd@redhat.com>
>  R: Wainer dos Santos Moschetta <wainersm@redhat.com>
> +R: Willian Rampazzo <willianr@redhat.com>
>  S: Odd Fixes
>  F: tests/acceptance/

Thanks you! I hope we can upgrade this entry to a M: tag soon :)
Meanwhile, applied to my integration-testing tree (and sorry for
the delay...).


