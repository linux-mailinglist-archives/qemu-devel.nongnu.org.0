Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E506F33BAFE
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 15:12:33 +0100 (CET)
Received: from localhost ([::1]:44454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLnxQ-0004YH-LU
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 10:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lLntd-0000Wh-Gi
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:08:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lLntc-0003Fl-04
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:08:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615817315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=axpLfKcTTFinSU6qO2NJpMQe+feDXkrDD2PRbkls5dk=;
 b=GPo0PREpsuQhRr7m17b1t+XgCva51TPWdAfcYKveAKhPpxD1V5HO37T+bedgs/H1ei+luN
 CGIxOFl84zqmi1g7ttnBqzSfnQj2Xc3yj4qDv4X9z9hDDMPYt6B6WY8ZebKvnuuK+i6N8P
 gy09HqbproeJ4M+Fw8hahDwQC7MBZzE=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-MUvJMQvuN5mTXET6XbJ8Xg-1; Mon, 15 Mar 2021 10:08:34 -0400
X-MC-Unique: MUvJMQvuN5mTXET6XbJ8Xg-1
Received: by mail-ot1-f72.google.com with SMTP id 88so10083828otd.17
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 07:08:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=axpLfKcTTFinSU6qO2NJpMQe+feDXkrDD2PRbkls5dk=;
 b=XUH9+UZKlTGAwWmRzqqDOlzr1hc6tORF1gWCL6vZz79yl1NLjjn5f07sKOuokqiZz9
 NIDL0ohRuqmxU2iM/iRH7qqzRkVwNI1ZpuyD+w4ejauch+GsdEcUdckUSdNdO6k14jtV
 x3sPd5YrKUpBo6nqLzEEMYyTBpPBuRztfnui/Dy5CXw+ScHMXg7eJ4EEIS+9i655wEdI
 yDNxlJhntI1TGM5Flu0fuGtrS8AwQD+m1wjkkocHGazq2693XBtPWq6Po/AcQpnzwfAN
 RjdgI89hsALKPu5ZWpl8q+VBzaOJHOkXts018K3nHU/WziVNVAHgA5AgHK+h2F2xVcg5
 vjrg==
X-Gm-Message-State: AOAM531bmEU7SRR+xMgnCF30WzyF3elHWEIRmFkRn0V82Ji7XPiEnVex
 6Pw9+EQpFDUGZZVm543azqm2LLt8QXeNw/Gt6Lqd8sFCgAMlQsEpFhMwXJErbnXa/2/XixUrQbv
 e74z3kvH2iQjusbo=
X-Received: by 2002:a9d:6043:: with SMTP id v3mr13877253otj.357.1615817312344; 
 Mon, 15 Mar 2021 07:08:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTDmmS9JsB9LcL4yQ/ScSv+OweeidZxjnSIwQ2PE6ytic8yR8eGWaeqcipjrmojaWM9J1s1g==
X-Received: by 2002:a9d:6043:: with SMTP id v3mr13877236otj.357.1615817312152; 
 Mon, 15 Mar 2021 07:08:32 -0700 (PDT)
Received: from [192.168.0.173] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 y194sm7131172ooa.19.2021.03.15.07.08.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 07:08:31 -0700 (PDT)
Subject: Re: [PATCH 0/2] SEV firmware error list touchups
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-devel@nongnu.org
References: <20210218151633.215374-1-ckuehl@redhat.com>
Message-ID: <cd383ad9-21c6-340d-8821-c151e1b9714e@redhat.com>
Date: Mon, 15 Mar 2021 09:08:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210218151633.215374-1-ckuehl@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, ehabkost@redhat.com,
 brijesh.singh@amd.com, thomas.lendacky@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/18/21 9:16 AM, Connor Kuehl wrote:
> Connor Kuehl (2):
>    sev: use explicit indices for mapping firmware error codes to strings
>    sev: add missing firmware error conditions
> 
>   target/i386/sev.c | 48 ++++++++++++++++++++++++-----------------------
>   1 file changed, 25 insertions(+), 23 deletions(-)
> 

Eduardo, Paolo, Richard: ping


