Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D25667BB5
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 17:45:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG0hQ-0004nV-5s; Thu, 12 Jan 2023 11:45:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pG0hO-0004nG-Fj
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 11:45:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pG0hN-0000tn-2E
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 11:45:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673541904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+tQNfvIa7u1GFvkV36rrwEcfXJ4C4E8kvB4+sByR+Oo=;
 b=dIphkjkmOtFJjOgf6sauqs7w2GY8ysw0Meu/sbjuBNVIuqAqqO2m9Mr5A9uiSjFL+D9BWw
 NoyhlDy+IJIuSNb/wJqICFLzQjPWZ5lJba+t/JQTCRsYrzJvAugSpCIR7zHMiAm+hMIKNr
 TRqQKBqe/ZllsI7J4HVe8xGapHzVejw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-529-W8Uw4j8-OoKbE-wsGuRSBw-1; Thu, 12 Jan 2023 11:45:03 -0500
X-MC-Unique: W8Uw4j8-OoKbE-wsGuRSBw-1
Received: by mail-wm1-f70.google.com with SMTP id
 m38-20020a05600c3b2600b003d23f8c6ebdso2973717wms.0
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 08:45:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+tQNfvIa7u1GFvkV36rrwEcfXJ4C4E8kvB4+sByR+Oo=;
 b=I2+foL4dGgog1rkktF0TUQzZkz4xTT16jDdivJKaAtNm3qBn2qIvic1ayNwXxg9oHS
 RJ+XC9Fxv20tcdeingk0At6PrZoZkVqDQsP9hKhOAdKlcthEEqwGPXTVyDAVtJ3E4SGB
 QX7woJgKGmDQwNcBFM1uRoSXScHdvgtyX1Oec9fWlOfYQ+FA7L65WDQ2lx8vnnwK/PQS
 EgfI1zore2yTxCJd4Vcrz5oxXT/wJQ3MpMHNBPdr+b67Kl5yh9CYkyDQHfjfXNijbJ8Y
 jYc1SI3fRbwi2V/cpYFV64H/CwsZh35e+1g2aKL1EVTmvufHeqPp7XigT5USW0o8D70r
 LaXw==
X-Gm-Message-State: AFqh2ko8gantDcOHT8IvsF9NYyrh7x+j/169QdUEkPajJqG9gBX6WZJv
 +piLn1LGmr9+nV9fh83Z6uUmCfGXY4qy3PaqUBMm6Vd37KNLYVEqdL6WdLqw1dutRviYoHSZeIc
 74crJThJ0i6EC+QBtW8vNPPMtHlCc1jvnWUfU7ZFmgsD2xDuSQ30/H+qpG2vXjD4=
X-Received: by 2002:adf:f24c:0:b0:2bd:dbbb:e7ef with SMTP id
 b12-20020adff24c000000b002bddbbbe7efmr622526wrp.47.1673541902018; 
 Thu, 12 Jan 2023 08:45:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtCWIiSfSsj8GiMkMPWk+8YzkktbUh80hq2fHNrsLBrfjmYdvrGdadKF2S/vV7lQNe1apUyXg==
X-Received: by 2002:adf:f24c:0:b0:2bd:dbbb:e7ef with SMTP id
 b12-20020adff24c000000b002bddbbbe7efmr622512wrp.47.1673541901703; 
 Thu, 12 Jan 2023 08:45:01 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:4b00:f595:490f:692:a6f3?
 (p200300cbc7074b00f595490f0692a6f3.dip0.t-ipconnect.de.
 [2003:cb:c707:4b00:f595:490f:692:a6f3])
 by smtp.gmail.com with ESMTPSA id
 e1-20020adfdbc1000000b002b8fe58d6desm16964134wrj.62.2023.01.12.08.45.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 08:45:01 -0800 (PST)
Message-ID: <cbc6dfe5-cb6a-0691-821f-5ea5804942ed@redhat.com>
Date: Thu, 12 Jan 2023 17:45:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 0/8] virtio-mem: Handle preallocation with migration
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
References: <20230112164403.105085-1-david@redhat.com>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230112164403.105085-1-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

Subject for this series should be "v4" ...

-- 
Thanks,

David / dhildenb


