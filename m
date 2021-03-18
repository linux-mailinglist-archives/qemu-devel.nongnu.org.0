Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EBF340F3C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 21:32:41 +0100 (CET)
Received: from localhost ([::1]:37870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMzJs-0007FE-Q8
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 16:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMzID-0006WD-6V
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 16:30:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMzI8-0003ji-Tq
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 16:30:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616099447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+3NT0xjeBkPqA5sG/aiaeAZLlS6xaLYnA8iKgfmifTo=;
 b=YQuw4PZ+XlpfPC7oDm09WXk0UBt/1ga4kLMqRRtkD4hWL7+qUNIfDqkz36/9UZopLhatv3
 dEAlY8k+UfKsKsSwBX2pM5rOzenxM+PL5XPaiEpmEsv78K68PPF1gR83TjBEk4tds3Q/Tv
 xxq9ckhlYsnPw2q/BrP4BACXpSAxORs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-Y04jhIyaNq6XBB-NMaldfw-1; Thu, 18 Mar 2021 16:30:44 -0400
X-MC-Unique: Y04jhIyaNq6XBB-NMaldfw-1
Received: by mail-wr1-f72.google.com with SMTP id n17so20675602wrq.5
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 13:30:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+3NT0xjeBkPqA5sG/aiaeAZLlS6xaLYnA8iKgfmifTo=;
 b=SsvyaAom2pNuP2YDnfijSgQvkL2vvq91v6pRBTyRCbRldLvwCCE6zb16i1LssXeBHj
 AKH9leam+gFUacw7CqzEW97CUMrZxnMJn8md0lcLIHVemyu2YTYy35ALBbD7J78bqIs/
 9BIM1gho1EHa3+48YbUf+AAaeUlgAfa1sBFLL6CnbxQgxY6z9bEmngm9K5lw2oFegL0r
 AzwzX3laddXiDTaOJr2uCpT9vn3qeb87QAQKp1UB92Ei2gxt5EWmnUuhJrAE4NoUvv9u
 mPBvaHMOXTS3QG0dZ0G0R1GDLJCRNjyQXFeCma2Cdu7ntcELYNXHo920igrBVn+qbY/A
 HTkQ==
X-Gm-Message-State: AOAM5327JyPWti5CyTF86oYD3dUWz9VE78Eduiaw+utBXzRfow0b6XKK
 riecvbbh6ph70vyxwtzwtBYdFgyvIZi5tI7YB9qkdaej3Tw4a5WUMQJVmUfzSC1gFbtoGLwf/HV
 kVVvVT+UQem8vzIfy91HT5vHs/3UPRLWSod1gIiw7RhVxvEvhcyro9zJTAn8QYjh82KY=
X-Received: by 2002:a1c:c20a:: with SMTP id s10mr805862wmf.144.1616099443165; 
 Thu, 18 Mar 2021 13:30:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzOOBzo0H/LrifyTxvfU5d/DVILx7UP+xQ/vYODe0fZ/Wu0u2buh8MGA0oU/Y3PoZlQsemlA==
X-Received: by 2002:a1c:c20a:: with SMTP id s10mr805844wmf.144.1616099442943; 
 Thu, 18 Mar 2021 13:30:42 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s3sm4244983wrt.93.2021.03.18.13.30.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 13:30:42 -0700 (PDT)
Subject: Re: Serious doubts about Gitlab CI
To: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <cb9d0504-aba5-3114-d121-694a5247764c@amsat.org>
 <YFOt+R77HfpNEYFc@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2d1e40c6-5fa4-271f-5ecc-74da7c04ffea@redhat.com>
Date: Thu, 18 Mar 2021 21:30:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YFOt+R77HfpNEYFc@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/03/21 20:46, Stefan Hajnoczi wrote:
> The QEMU Project has 50,000 minutes of GitLab CI quota. Let's enable
> GitLab Merge Requests so that anyone can submit a merge request and get
> CI coverage.

Each merge request consumes about 2500.  That won't last long.

Paolo


