Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B65415C61
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 12:59:41 +0200 (CEST)
Received: from localhost ([::1]:42758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTMS4-00007j-4J
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 06:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTMQC-0006WC-Qa; Thu, 23 Sep 2021 06:57:44 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTMQA-0002TF-4F; Thu, 23 Sep 2021 06:57:44 -0400
Received: by mail-wr1-x42d.google.com with SMTP id u18so15980138wrg.5;
 Thu, 23 Sep 2021 03:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FgHYBTlRLh5iU9Ke8Nv0+SgxWnQGjaZgZGhIeifYXos=;
 b=F0RAe2TU8AzLY8pC92orIO6ZRH/iMa+u9IfW4a9qoTz/o+pAR67/AkoeYH7ZGzt9Z1
 oqDaV4Wu3/zHvWjWdE7IJI3L1LFEiTiklwg/Tv/lyurG/aavBE6vNe2ohbqGLGd3bYUw
 W4DObv1cCCWlJMfm5yxQHvM/eh+vlsdQA+QGK+kzVEJO6Wm99K1g0U4w3E71AUaP/Q4t
 INer52wOeggvktjp0KPSWBK1LJPQ91ZTh7AWtHMdc6JD6VZ4ZmltufZB330f9bjUjlsq
 9kxsCNSYOks4cj5BE3Q9iCHXlHp11FxOEKd7nN96iw6AeB1sRtfcypYna7Bzbjogx3qG
 w8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FgHYBTlRLh5iU9Ke8Nv0+SgxWnQGjaZgZGhIeifYXos=;
 b=BupN76gujDdCyYYyzhYbWlfJsBgWAxanKRCJoCfsoqmvknFCvOki4njQ0YCd5r44y3
 dBy3MmYDaOjM5NHj/Az5w6pTVXkQbIh7XQGuLQnHwabwOEiGZ1Eq4k2CtK1uA1TzBM9D
 rXSLyE4fU1pKZxkYYIKqgXsyfyJl0bx12zF0MPjsrgvmqITXmW09+nPrnsQ6X/ITmly7
 cyMR3Sw/598Lz2YDYunlBhRweb+nT2CvtcgwenHH22/0Mrrt3HFL2Ow5fxhd24SdkCiN
 iRFp54TLPCGePzQWwz11BH7Kr7HBgjOz8+9WGep/2UgU8bgaRGJgWAL1iEIGpQHPe+hE
 rtHg==
X-Gm-Message-State: AOAM530Rl0aHK3mE6qR4hs9M/FTxCQnr0IRWX8MP+y2QW0uCNymgSop2
 uARGXZVGPJ5u6gqxuWKlsJ0=
X-Google-Smtp-Source: ABdhPJxfd7IRWVnT0sd+WdL6w25R1LskvSk5Rly/peGjOwl5fXZCpE2jWVblILt3UJ42HDlMqUK1jw==
X-Received: by 2002:a5d:64e2:: with SMTP id g2mr4418832wri.20.1632394659984;
 Thu, 23 Sep 2021 03:57:39 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id c7sm5227338wmq.13.2021.09.23.03.57.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 03:57:39 -0700 (PDT)
Subject: Re: [PULL 18/28] file-posix: try BLKSECTGET on block devices too, do
 not round to power of 2
To: Halil Pasic <pasic@linux.ibm.com>
References: <20210625141822.1368639-1-pbonzini@redhat.com>
 <20210625141822.1368639-19-pbonzini@redhat.com>
 <20210906162420.5af35eb9.pasic@linux.ibm.com>
 <20210922215143.7f289016.pasic@linux.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ba39ff70-9f0a-1e90-a626-c001e6f7f741@redhat.com>
Date: Thu, 23 Sep 2021 12:57:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210922215143.7f289016.pasic@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, "open list:AIO" <linux-aio@kvack.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Benjamin LaHaise <bcrl@kvack.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Hoeppner <Jan.Hoeppner@de.ibm.com>, Stefan Haberland <sth@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/09/21 21:51, Halil Pasic wrote:
> We have figured out what is going on here. The problem seems to be
> specific to linux aio, which seems to limit the size of the iovec to
> 1024 (UIO_MAXIOV).

Hi Halil,

I'll send a patch shortly to fix this issue.  Sorry about the delay as I 
was busy with KVM Forum and all that. :(

Paolo

