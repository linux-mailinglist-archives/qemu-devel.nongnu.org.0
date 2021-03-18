Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0576C340A42
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 17:34:18 +0100 (CET)
Received: from localhost ([::1]:52866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMvbF-0005pf-35
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 12:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMv7C-00011m-DG
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:03:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMv76-0001u2-DQ
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:03:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616083387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v6aDnjbFX14DbEN+gfb+wQpDsbPrFbum2UkUAlg36P0=;
 b=FnzUdmzs5RpA2wycqsseGQ6+B998+uhSWL+40WAN7ucrVBDa6sSicmpOuK8kej4UeHfg3J
 ChFscblBlRGp1OWXU5WZscGCXKyOomZliE7rP3aVKmP6xmJK+RP4SO/ru+c2r8NFdtB9dH
 ScFjisGz1aHVtkyk/hcR7LWAwjyXssI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-wyFmxm-CNtq6ouL-P8BMHQ-1; Thu, 18 Mar 2021 12:03:05 -0400
X-MC-Unique: wyFmxm-CNtq6ouL-P8BMHQ-1
Received: by mail-ej1-f71.google.com with SMTP id r26so16908554eja.22
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 09:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v6aDnjbFX14DbEN+gfb+wQpDsbPrFbum2UkUAlg36P0=;
 b=Uecyk7ooAPea8RBs66Z7f7/uMlQnT9h6pxP3V9ikftKvB9bf8g16/hr0CV3sFb3AsM
 uvIW/34PcXCNdp2xFKis5resieyaWnHF4tyOhUGvm0kz80uh2gHst38YoA/UtOp2SZKy
 sk2rgzOPARDOQcMA1hd95Nv/yaGJxAdFNTer3OHB93AQdpR6+86RJwvUEPzSLQ0LLTTO
 TI1E+9Hgxz+K0cfvwqdbl4TFtMBcVtKcWBikA0PwylWbLfT4L6B9oC9KK7RCElJ32LPf
 SzeioLrT2aqluSdg72C9CQLhIy+2lVXe8YR8r6YzaWCTt0QDUdv5eq6kQP198qy+Hg7+
 IXzw==
X-Gm-Message-State: AOAM53336i+YLR8L7HC7nvAkhHrkhzgCS8lctJtP6ImUT2SbJv95uIU0
 xnxoSDuWLtj7Q0LqCPGond6fbjuniD7B4cudjN6/2dRVDQt0WP77mCH3xR6my3AkzCAFaOmkUEk
 t2SSYy8oFD+UjMTc=
X-Received: by 2002:a17:907:3f26:: with SMTP id
 hq38mr41909669ejc.374.1616083384446; 
 Thu, 18 Mar 2021 09:03:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPUTJbRg3T85uaW/H4GU3Y6pi+q5Px+K3YTijZ8PC03YYO9lFwGGaWGp1KqCOwRCegDwQBLw==
X-Received: by 2002:a17:907:3f26:: with SMTP id
 hq38mr41909625ejc.374.1616083384094; 
 Thu, 18 Mar 2021 09:03:04 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v12sm2157164ejh.94.2021.03.18.09.03.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 09:03:03 -0700 (PDT)
Subject: Re: [PATCH] intc/i8259: avoid (false positive) gcc warning
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
References: <20210318154738.27094-1-borntraeger@de.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <69bb59c7-1f97-ba07-5150-d94d03210920@redhat.com>
Date: Thu, 18 Mar 2021 17:03:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210318154738.27094-1-borntraeger@de.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/03/21 16:47, Christian Borntraeger wrote:
> some copiler versions are smart enough to detect a potentially
> uninitialized variable, but are not smart enough to detect that this
> cannot happen due to the code flow:
> 
> ../hw/intc/i8259.c: In function ‘pic_read_irq’:
> ../hw/intc/i8259.c:203:13: error: ‘irq2’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>     203 |         irq = irq2 + 8;
>         |         ~~~~^~~~~~~~~~
> 
> Let us initialize irq2 to -1 to avoid this warning as the most simple
> solution.

What about:

diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
index 344fd04db1..bf28c179de 100644
--- a/hw/intc/i8259.c
+++ b/hw/intc/i8259.c
@@ -189,20 +189,18 @@ int pic_read_irq(DeviceState *d)
                  irq2 = 7;
              }
              intno = slave_pic->irq_base + irq2;
+            irq = irq2 + 8;
+            pic_intack(s, 2);
          } else {
              intno = s->irq_base + irq;
+            pic_intack(s, irq);
          }
-        pic_intack(s, irq);
      } else {
          /* spurious IRQ on host controller */
          irq = 7;
          intno = s->irq_base + irq;
      }

-    if (irq == 2) {
-        irq = irq2 + 8;
-    }
-
  #ifdef DEBUG_IRQ_LATENCY
      printf("IRQ%d latency=%0.3fus\n",
             irq,


?

Paolo


