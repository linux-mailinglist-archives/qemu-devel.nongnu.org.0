Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4531B4170B3
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 13:12:39 +0200 (CEST)
Received: from localhost ([::1]:53810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTj8A-00052x-B6
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 07:12:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mTj7A-0004C0-9t
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:11:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mTj77-0000IH-1H
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:11:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632481891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MqEAXoGjeURengyS8Nx81F5D4jdQgqvwPedNiyQzNok=;
 b=iXkIXHM+IIOUGaVfzZxgF0Db/xsGqWf3ujUMETwkp21oDAEvJ+c5ksBHLvJnUU3Zh+E6JY
 n6vgBoBs9mxTKFXY7T4zCLIotVtnZ5eTeOxSgyEqFNKK3arKSemvA2XAPigOFIApoK33ts
 hHrPeivBYaXBZvtIpaOJ5ymi8W4H5mA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-nKBSpAeuO4msIDFYsRvCCQ-1; Fri, 24 Sep 2021 07:11:30 -0400
X-MC-Unique: nKBSpAeuO4msIDFYsRvCCQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 x7-20020a5d6507000000b0015dada209b1so7720719wru.15
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 04:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MqEAXoGjeURengyS8Nx81F5D4jdQgqvwPedNiyQzNok=;
 b=7N8zOGQMui/RuvTAKnoOjh+rBXsrW1Vrgp5CxvHfUyEljy2kfm3OFcNi2+Zt6EuYjt
 P0CO1waBSvzUUztaDBkb5CIPDueiohrq3DzGTgWGvGcELVlxVY2krMv4u6wTroP/juAh
 jGra/j2+FpHWBlwxi4GjU8ok+K8uzGzFcU7SWWY7nbPuotebwti3l1yNGBBASgvkHdG2
 Aw2fu58h0N/N8QYBOn1V8aQEK5cBbbtWCSGIyXajSWQhCtVVt30wKp+LSEXZz3TUnGFD
 LR6hpHEy8DQXE1dZSRTcjOFdM81J0oQO4PArslqERBQ0iDc7naeFRmCujE0TMN+zZ/6p
 yxTA==
X-Gm-Message-State: AOAM532O++8/H3bm/ENVK5i9MnSpg5SbY9t8Wn5YKJ2scyMAhFCjmQaV
 rrnJVAgszaow90hJlyACb97V8b/9GKIx3IyJtrOn2LX0vY3JE+Nu6U8v8WCJxwYkcJPwBeeHNBM
 pKUOdBLnfXXgjOs8=
X-Received: by 2002:adf:82a8:: with SMTP id 37mr10604011wrc.409.1632481888963; 
 Fri, 24 Sep 2021 04:11:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfH4Ug3/p1PpJPdJw63s0ntoEFZp6+3E2kFiz2gNqeDhJFOzLEy1vBSFcjZZ1BBnhYjOslWA==
X-Received: by 2002:adf:82a8:: with SMTP id 37mr10603988wrc.409.1632481888792; 
 Fri, 24 Sep 2021 04:11:28 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id d70sm7992705wmd.3.2021.09.24.04.11.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 04:11:28 -0700 (PDT)
Message-ID: <f4d6144d-42e4-6954-41ce-87b7d60c3811@redhat.com>
Date: Fri, 24 Sep 2021 13:11:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 5/5] MAINTAINERS: Demote sPAPR from "Supported" to
 "Maintained"
To: David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210924095536.441849-1-david@gibson.dropbear.id.au>
 <20210924095536.441849-6-david@gibson.dropbear.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210924095536.441849-6-david@gibson.dropbear.id.au>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, dbarboza@redhat.com, hpussin@reactos.org,
 aik@ozlabs.ru, mark.cave-ayland@ilande.co.uk, groug@kaod.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 11:55, David Gibson wrote:
> qemu/KVM on Power is no longer my primary job responsibility, nor Greg
> Kurz'.  I still have some time for upstream maintenance, but it's no longer
> accurate to say that I'm paid to do so.  Therefore, reduce sPAPR (the
> "pseries" machine type) from Supported to Maintained.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


