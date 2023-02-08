Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2A768FA21
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 23:15:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPshp-0007Y5-Cv; Wed, 08 Feb 2023 17:14:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPshn-0007WY-FC
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 17:14:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPshl-0002a6-TW
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 17:14:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675894457;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=lQ6EljoD5QK2A8I8CAE85syLfcXMqsui/fAOwmLyO1s=;
 b=F3otbyKL+sgGhjr6HSXTUOVRO57U0BeYOmWVoPPCyfrHXNU/uMfaVcHK+WEqXh99Hx56+p
 xDkO1W51EkCSotmxp4ddFCbnehi2tIK+pwKNXpajvbKaS21vGW/w44Mb49lysIP5F49RJY
 QU4cye6bWuizRrgP04HT5al2JXf8oKM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-354-MUDGy2wtMl2mYU3CPySM0w-1; Wed, 08 Feb 2023 17:14:15 -0500
X-MC-Unique: MUDGy2wtMl2mYU3CPySM0w-1
Received: by mail-wm1-f69.google.com with SMTP id
 n4-20020a05600c3b8400b003dfe223de49so1808078wms.5
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 14:14:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lQ6EljoD5QK2A8I8CAE85syLfcXMqsui/fAOwmLyO1s=;
 b=QkdG5QsSdtNlkRWmsSWKUwtw7KhlJtezzGQbQJTPjPGFXdfg0bl+av6jsJkqIDlSTy
 ALke8u1tt+/2Oi8HmgwuPEMst5UFJpCDCKJ9M8sHTZPsswbF5ozuT70pLayVjbGaSKtN
 a3ZyduNeFpTJQbsWx+RYJVck2NXUXgS3fTzvX9rZFhg3NMr1RtGnwkblNnxPEBFGlzt3
 FsBlENCu6HBbiUrIebp1Ei6pKRcinvvATB97ViTxaCQq5fq7qoS8fdKAriYM7lFMou4u
 Tfmr/10GIEgGkA72qd8qzmUHLldyPmUpZQtj4Hd1PrBWwAR50abQqqhOp6jF2olYvWaR
 ZwMA==
X-Gm-Message-State: AO0yUKXCWmS1QwLDXN9wqwScZs9lshq5ErQU7KiR+yMG8Fpv/+P99GFy
 5K5VqUqjIUrH38MM24GvrdGKKT+IyYWLRp5cBArMQ1ruz+nSbO5we5tSXYIIohtafn8La6NjPUc
 hxDhXeNvzgq8erSI=
X-Received: by 2002:a5d:6791:0:b0:2bf:963a:f266 with SMTP id
 v17-20020a5d6791000000b002bf963af266mr8388908wru.27.1675894454390; 
 Wed, 08 Feb 2023 14:14:14 -0800 (PST)
X-Google-Smtp-Source: AK7set9qgL1DWvlRED2/ESM62fQbw3t0w9BcuHGnZDO3yGehYqy5LwiM6n2FbG+9rNNpw63V4hmuqA==
X-Received: by 2002:a5d:6791:0:b0:2bf:963a:f266 with SMTP id
 v17-20020a5d6791000000b002bf963af266mr8388883wru.27.1675894454169; 
 Wed, 08 Feb 2023 14:14:14 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 d17-20020adff851000000b002c3dd82a0e9sm11708385wrq.91.2023.02.08.14.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 14:14:13 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  pbonzini@redhat.com,
 peter.maydell@linaro.org,  peterx@redhat.com,  david@redhat.com,
 philmd@linaro.org,  mst@redhat.com,  cohuck@redhat.com,
 dgilbert@redhat.com,  maz@kernel.org,  zhenyzha@redhat.com,
 shan.gavin@gmail.com
Subject: Re: [PATCH RFCv1 7/8] hw/arm/virt: Enable backup bitmap for dirty ring
In-Reply-To: <20230206112010.99871-8-gshan@redhat.com> (Gavin Shan's message
 of "Mon, 6 Feb 2023 19:20:09 +0800")
References: <20230206112010.99871-1-gshan@redhat.com>
 <20230206112010.99871-8-gshan@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 08 Feb 2023 23:14:11 +0100
Message-ID: <877cwr9558.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Gavin Shan <gshan@redhat.com> wrote:
> When KVM device "kvm-arm-gicv3" or "arm-its-kvm" is used, we have to
> enable the backup bitmap for the dirty ring. Otherwise, the migration
> will fail because those two devices are using the backup bitmap to track
> dirty guest memory, corresponding to various hardware tables.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


