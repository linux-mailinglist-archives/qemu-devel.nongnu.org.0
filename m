Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1123F59E6
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:37:10 +0200 (CEST)
Received: from localhost ([::1]:45136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIRvh-0008CH-PJ
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:37:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIRup-0006xn-U8
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 04:36:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIRuo-0005GL-4a
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 04:36:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629794173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KHY8wSQQE4TDUcCbCEESY9A3fGpksl7FnxS4YoVxf0s=;
 b=EvmAIsN4ew28GC7mA0NA5lqgDPLH7uPejQjmq8uDo/3KPGqUKKTz7ik0uNBY4MWrzW/8pm
 QL+lT9dBC747xsAPALllGZPCmUrH9zqjdARX+c/N5CPKF6QQEcpxpo+JdbBEhp5JF6rS1x
 V+vrcZbIqc8yQrmOAANmTYhNiK+D0Ng=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-6d_YRn1kNzWovSZ4eJcOJg-1; Tue, 24 Aug 2021 04:36:10 -0400
X-MC-Unique: 6d_YRn1kNzWovSZ4eJcOJg-1
Received: by mail-wr1-f70.google.com with SMTP id
 h6-20020a5d4fc6000000b00157503046afso1489196wrw.3
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 01:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KHY8wSQQE4TDUcCbCEESY9A3fGpksl7FnxS4YoVxf0s=;
 b=WkBFjKJtyY+/Y2ok+E1QQWi8Yf3ZlznxQA4frfIG1WTJ8jp6+VX/bOLk4CIvOFiGHu
 k2UOc8Y6eFU3ZwYkcZqc4iC9Yg1XLaDnGfj5ifW5f4f218wxXLyCelZEUGeWiOjLqAaF
 LWLeAJf4vLKacLItIY9ScqiFqSdE5IlRqvhFgvCRinHW34NZ87pRhnUykCxvyesgi9LV
 KPAVWWHQPCE89KJikwnq3pBr380RTcsjSlIupQnTj7TQLPE5YQy+XuwZ5cYMJU6DdDXo
 WtCJkF7BpmpBer0hem1cnwB4896Awe1tphj3bQqQgIa1JzC8yG4kwUJX1n3hB/tvkKgV
 sYjg==
X-Gm-Message-State: AOAM532oAr+cnIxTCazvQY4fXmB0Zv/c5cGp+tsAdkA1dULJ4//Fs33P
 y4jx8Ak9Il6K73KFZrTlGTsGGuqCYPiJud78vwpd6PNwfbHRv4uwQMJaQtbA2DusejNiu41heFN
 yKTLYe4cXmw2J3iM=
X-Received: by 2002:adf:f84d:: with SMTP id d13mr16608171wrq.292.1629794169797; 
 Tue, 24 Aug 2021 01:36:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiybfAvbOCbTXAKFrjZbd3+C0rSDGK85C2pJIp2zAv1/yfp26zkOlSus5Du6y82nBzaiT6LQ==
X-Received: by 2002:adf:f84d:: with SMTP id d13mr16608160wrq.292.1629794169682; 
 Tue, 24 Aug 2021 01:36:09 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id l2sm1628008wme.28.2021.08.24.01.36.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 01:36:09 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: add fuzzing reviewer
To: Qiuhao Li <Qiuhao.Li@outlook.com>, qemu-devel@nongnu.org
References: <PN0PR01MB63528E3A58EA06BD1B242486FCC59@PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5856378b-84f7-a191-cb9d-f89f17acfb28@redhat.com>
Date: Tue, 24 Aug 2021 10:36:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <PN0PR01MB63528E3A58EA06BD1B242486FCC59@PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.023, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: alxndr@bu.edu, thuth@redhat.com, bsd@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/24/21 8:26 AM, Qiuhao Li wrote:
> To keep me cc-ed when something changes. Suggested by Alexander.
> 
> https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg03631.html
> 
> Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


