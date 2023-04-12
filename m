Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAE96DF76D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 15:40:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmahN-0003jD-SA; Wed, 12 Apr 2023 09:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pmahM-0003j2-1C
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 09:39:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pmahJ-0004pl-Ij
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 09:39:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681306780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uXGQo8nOYtOUNRUBfFQ1TatclODevvN5n0IJAYOTL1I=;
 b=Pg63I9U+zIuOPwyife4XrNW3LPA3B/qQdhIVHq1pFcab8a17gPBLOJ9kyIHo7u6tuqkf2c
 bM+Y8y5Dg3K0T9+KKk4mZeUd7QaWIh3dweVXcWXlZLpVnNrp1A2oAUbbuXfCA0zD828X9O
 CbOjMoDMANNLujB5P6nWtxx5xpQB4dQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-bGp73n3KOnKL-Ny2hReyFg-1; Wed, 12 Apr 2023 09:39:38 -0400
X-MC-Unique: bGp73n3KOnKL-Ny2hReyFg-1
Received: by mail-qt1-f197.google.com with SMTP id
 e3-20020ac84e43000000b003e259c363f9so8910595qtw.22
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 06:39:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681306778; x=1683898778;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uXGQo8nOYtOUNRUBfFQ1TatclODevvN5n0IJAYOTL1I=;
 b=ZtCvj+Ptp7rtVqSA2OIkA3KFWIYbQ2xYdqKgWpYw3/o2fHGLq+n2C8TrHPcwiMmxdV
 A3Zorh302+CEMRasC4rlLhsxhIBInKrYcKBrnp7DyIW7RGJevp4H2EJ5nRgAf0O2N9xJ
 p/bFD8j/EyQJUr+uDNLziZUkt9gu+0mtuPXoa695d1nRzK+S63aaquwqv5gphmnP24Jz
 JnmnlFZqsSBkHQHFQpJ7BNQTFFQYZEgKZ46uCXWdDvy5jU+xhmXnQZuSqnRxiv5XN2Uw
 xJsxVmiKEIqfHAYcRw5gt9V58zALJ33Ahset8buE7PGZ8mqrIn1FyjqUzSBqL4CXzGX9
 uq+w==
X-Gm-Message-State: AAQBX9eZ+GswfH0+NDsXFwO5sDOgCMZY+f660gXluSYlLx2lCs6X06vK
 effqf/p1dSZ9nabaMpNaTVHJJ2HP4xtdc3f4e/DQDoKTsVKhZl+JeaJcnhOF3THaRFUwTFF1YS2
 EuSBWYKxCiFjOKRE=
X-Received: by 2002:a05:6214:daa:b0:56e:9da4:82ff with SMTP id
 h10-20020a0562140daa00b0056e9da482ffmr24261085qvh.50.1681306777856; 
 Wed, 12 Apr 2023 06:39:37 -0700 (PDT)
X-Google-Smtp-Source: AKy350bEGBNDZ/pl/KcO07MVhmlhCk9fwyt71PFucyjXVk/s3HYcIfjCcHvae7yfmb9VTqwoG4Z3rg==
X-Received: by 2002:a05:6214:daa:b0:56e:9da4:82ff with SMTP id
 h10-20020a0562140daa00b0056e9da482ffmr24261060qvh.50.1681306777607; 
 Wed, 12 Apr 2023 06:39:37 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-153.web.vodafone.de.
 [109.43.179.153]) by smtp.gmail.com with ESMTPSA id
 ep9-20020a05621418e900b005e14936cb09sm4007938qvb.11.2023.04.12.06.39.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 06:39:36 -0700 (PDT)
Message-ID: <a2e3f75d-853f-6373-10b4-cf33a4599c75@redhat.com>
Date: Wed, 12 Apr 2023 15:39:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: source fails to compile on msys2
Content-Language: en-US
To: Howard Spoelstra <hsp.cat7@gmail.com>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>
References: <CABLmASGEEMLWTwsZN1Yft_B5tV6Cw_2MXv-as_A3CQYhrn-nWA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CABLmASGEEMLWTwsZN1Yft_B5tV6Cw_2MXv-as_A3CQYhrn-nWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.083, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/04/2023 15.13, Howard Spoelstra wrote:
> Hello Peter,
> 
> My source was cloned today. I just cloned again and I still see the tokens 
> reversed:
> git clone https://www.gitlab.com/qemu/qemu 

You're using the wrong repository. The official QEMU repo is here:

  https://gitlab.com/qemu-project/qemu.git

  HTH,
   Thomas


