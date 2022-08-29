Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2117F5A49F6
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 13:31:33 +0200 (CEST)
Received: from localhost ([::1]:37104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSczM-0003fE-8e
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 07:31:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oScxK-0001LO-Kd
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 07:29:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oScxI-0002I5-1y
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 07:29:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661772563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7L35x9gavV9flW6RYyrCNNtMjW3WWQCscqFDQXTGuMY=;
 b=GrRfHvDca77M+ElimyVlJDT1Q7uPF15P+ueSDzuO7M6irfQtxeVSBZ1gvo3GojF+uQ13L1
 zgQKw5JM1dpjX3r+KhwkmhJdchyqru+hAjq1zSPf9HwR1VUsr9cs7Rd+NPXGnwHySNGMLD
 wr/aCA1kz3i5mx1XaXaJSLFwhQo0VF8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-CUCUqQoOMXqmzzTdRhZ7Og-1; Mon, 29 Aug 2022 07:29:21 -0400
X-MC-Unique: CUCUqQoOMXqmzzTdRhZ7Og-1
Received: by mail-wr1-f69.google.com with SMTP id
 i27-20020adfa51b000000b00226d0b29adfso843974wrb.0
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 04:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=7L35x9gavV9flW6RYyrCNNtMjW3WWQCscqFDQXTGuMY=;
 b=rYXZUIa6OnhSEjkXCiFMeBYpamFvZfWhHyJP314/JwSfdcY2L59MYiPrSOEJM+FNTO
 g9BanuZkq3S7CkiWfSonRYh8aSqGxFhsau4W0wDcdMacHSPhCp5NVln2Sw9ct0eOEspo
 Pl4QXAxanzXMw9YNbNhVa+HvRYtDeSuBy9qZxIyyMnJAVw+jZnBsb2RQYWg0ZHr5RX/T
 o+55ZKPpi4bWul45YMpPdKFuLeDsdHTy2FTSZE2PCwmg7OlCxLmPVtuelYyTNwRfEgPj
 lb+COosGSuOKwFlfGrOfnumYaqqXGY2uFujhfcqpkreFZUIisiKwvhRLXR0c7ss6hZ1t
 PKgw==
X-Gm-Message-State: ACgBeo05oxuBOHIJTJ47MpPHceWKNavF1OS/dYYvZ2GBDe2ZpiiAKEBx
 GG7nIWrWNBAWkcm70gP+/n/0dxxqZKueBqH+bxPEl18S+j8BuJ0mSYuggyDdvLNeRD5+NhBPJwF
 Qgu9rvSGfnGOubL0=
X-Received: by 2002:a5d:6da5:0:b0:222:4634:6a4e with SMTP id
 u5-20020a5d6da5000000b0022246346a4emr6269517wrs.172.1661772560488; 
 Mon, 29 Aug 2022 04:29:20 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6CF81WtJZ6QkJXtFHzo5iZHFVRvbiCIyRc9Wtq7RwS7H8qHJHjfClRaOWa8hvgFoaZfQScNw==
X-Received: by 2002:a5d:6da5:0:b0:222:4634:6a4e with SMTP id
 u5-20020a5d6da5000000b0022246346a4emr6269502wrs.172.1661772560257; 
 Mon, 29 Aug 2022 04:29:20 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-147.web.vodafone.de.
 [109.43.176.147]) by smtp.gmail.com with ESMTPSA id
 d18-20020adff2d2000000b0022542581800sm7993107wrp.45.2022.08.29.04.29.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Aug 2022 04:29:19 -0700 (PDT)
Message-ID: <4ca776db-a344-4667-6efa-0f625a460aa2@redhat.com>
Date: Mon, 29 Aug 2022 13:29:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v5 15/18] s390x: Add protected dump cap
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, qemu-s390x@nongnu.org, seiden@linux.ibm.com,
 scgl@linux.ibm.com
References: <20220811121111.9878-1-frankja@linux.ibm.com>
 <20220811121111.9878-16-frankja@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220811121111.9878-16-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 11/08/2022 14.11, Janosch Frank wrote:
> Add a protected dump capability for later feature checking.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>
> ---
>   target/s390x/kvm/kvm.c       | 7 +++++++
>   target/s390x/kvm/kvm_s390x.h | 1 +
>   2 files changed, 8 insertions(+)

Reviewed-by: Thomas Huth <thuth@redhat.com>


