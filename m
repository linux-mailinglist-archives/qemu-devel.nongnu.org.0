Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9116B79D7
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 15:04:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbil9-0002rV-QD; Mon, 13 Mar 2023 10:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pbil7-0002rL-CR
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 10:02:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pbil4-0004XQ-LV
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 10:02:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678716157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SRabnfDHRZYyDs4hsB2X8Ab76a/FFi+ct4fSqKmmRDU=;
 b=FBQQXDj0dQMyqYOK45U+Wgy67KTH2uFbGDUXAiDXt6JXSICY3Rlbii2ETJMvEdDqhQPFcz
 tUbPfpd46FMoPGv33WY+aelCo7FOKmfvF/eZDEUiu126WD+kfiS0jSW/fpCRrkwJ70dTj9
 K0q1tKMBCxMF1Escs/cZkk4rtByuGPk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-xx2Jnf5-PqyaCnDyIOjwoA-1; Mon, 13 Mar 2023 10:02:34 -0400
X-MC-Unique: xx2Jnf5-PqyaCnDyIOjwoA-1
Received: by mail-wr1-f71.google.com with SMTP id
 g14-20020a5d64ee000000b002cfe47b8ec4so346179wri.10
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 07:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678716153;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SRabnfDHRZYyDs4hsB2X8Ab76a/FFi+ct4fSqKmmRDU=;
 b=JFZ2BySLBCiIHJqEAKzV2txshZyP8AQ4XFEy+LJXEbW16bJRhKfa/DBcb2zlpnCido
 ojLy9XexD8L3QaCZsjAJL0VrkV7pwoO44Rms7bPeJYsZPIQn3xvOQOsdS2O6X6cYEUqj
 yI51uq6d4TQ2zEiQX2uJIG5X3nk6Hp0hnGbldFqvcPabaP3IpRJSjuxx2W3Yh5sEQzw4
 AlX0U6wBS9Lrpzuf6fWbulS2gQoBjjv97HJovjD3iZ+BhML14BAwqCOuEETjlNM8UlCc
 6ApCf/05QSRtEUU95rT65zL+6WrsWwMJNdv5R9zkXsYkNxNrGg9LJ+T9fBEux+sHs8hj
 MllQ==
X-Gm-Message-State: AO0yUKUK/iTPKxPgP876yXPAdCIfxqDvDBLPthfYDYvsOf1wHyFZXjW6
 v7LMpmaFEoH2eeJyJv8SC9dojLV21p/a3RuD8CU+6olXWR6hV5IWQnk6+r8U01uamDwvZQYhCwQ
 UABEYMl/ipKdfD1A=
X-Received: by 2002:a05:600c:45c6:b0:3eb:4cb5:e13 with SMTP id
 s6-20020a05600c45c600b003eb4cb50e13mr10453298wmo.31.1678716153323; 
 Mon, 13 Mar 2023 07:02:33 -0700 (PDT)
X-Google-Smtp-Source: AK7set8MviqB4tz7K7YuUijG63j+fYTcO9qZ1ZVbiZHYkgNW84qyqPLsRlKIn5R+oF+p64hvdf83hw==
X-Received: by 2002:a05:600c:45c6:b0:3eb:4cb5:e13 with SMTP id
 s6-20020a05600c45c600b003eb4cb50e13mr10453257wmo.31.1678716153022; 
 Mon, 13 Mar 2023 07:02:33 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-179-26.web.vodafone.de.
 [109.43.179.26]) by smtp.gmail.com with ESMTPSA id
 z19-20020a1c4c13000000b003e20cf0408esm9107334wmf.40.2023.03.13.07.02.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 07:02:32 -0700 (PDT)
Message-ID: <c61ecf23-d055-01a8-b2d7-37367c4c1f63@redhat.com>
Date: Mon, 13 Mar 2023 15:02:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v7 0/6] memory: prevent dma-reentracy issues
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>
References: <20230313082417.827484-1-alxndr@bu.edu>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230313082417.827484-1-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 13/03/2023 09.24, Alexander Bulekov wrote:
> v6 -> v7:
>      - Fix bad qemu_bh_new_guarded calls found by Thomas (Patch 4)
>      - Add an MR-specific flag to disable reentrancy (Patch 5)
>      - Disable reentrancy checks for lsi53c895a's RAM-like MR (Patch 6)
>      
>      Patches 5 and 6 need review. I left the review-tags for Patch 4,
>      however a few of the qemu_bh_new_guarded calls have changed.

  Hi Alexander,

there seems to be another issue with one of the avocado tests:

  make -j8 qemu-system-aarch64
  make check-venv
  ./tests/venv/bin/avocado run \
    tests/avocado/boot_linux_console.py:BootLinuxConsole.test_aarch64_raspi3_atf

... works fine for me with the master branch, but it fails
for me after applying your patch series.
Can you reproduce that failure?

  Thomas


