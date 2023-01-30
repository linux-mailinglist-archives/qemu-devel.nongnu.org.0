Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE0768109B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 15:05:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUmB-0004S0-Cb; Mon, 30 Jan 2023 09:04:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMUm9-0004Rj-4h
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:04:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMUm7-0006u5-PB
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:04:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675087487;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=zyO7AJg1Rm/HflS9f747b1CXPQ0ShgDV2maKvR2haR4=;
 b=EE7cBZljeaNmIm3jUZ5nYaX2c25Ft7FdKZRS9ghgHTrEvZxp9Vdh67nNT11M92dE3ifAKV
 1nO+YUNi5QximrEP6Byd0XpFNaQi4sygcTpYDEMgkol4I3AKgIdSo5g8BFIiyuEb7VQ759
 abDSdZPnGTsR3uUB+cf7VswsICdjFqI=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-557-DPnvQny4MnW-ecESVAyDzw-1; Mon, 30 Jan 2023 09:04:45 -0500
X-MC-Unique: DPnvQny4MnW-ecESVAyDzw-1
Received: by mail-lj1-f198.google.com with SMTP id
 x44-20020a2ea9ac000000b0028fd85f2e0aso1888894ljq.22
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 06:04:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zyO7AJg1Rm/HflS9f747b1CXPQ0ShgDV2maKvR2haR4=;
 b=g2p7pGQxYzYiPycdpfyTYgKSnOJbQnIpnui+KxH90QS/yj2jguS/GT05FkWHK1eAWs
 PqwmPTABWih0WI2HPbS4znJSm5wRjdn5qFvfd+UKnjvno4zfPe9CYg5dR7HVTSu4Yjz4
 bdCOS/s21ZJ/4fxeUtqbKP9FvgiZ2VU2bGvpEsib1RYzIW2EvSso+TckPUJmfZb+ljU/
 YH3xtMXGZ9OX6KbEz2j036/PE75iuuHDrg0mTTsvbeUrLf6VUHVCYsbnV/KF3Grk+Ood
 KAybjmZimwclmSGN6xMTUNRrB5KM1GN4WKRLHbomnXI7DBBSo5SFRFKz3hmBx5zPwAEy
 a63Q==
X-Gm-Message-State: AO0yUKXGKK6KJxMuUUNlCkPHqkNYRle8c/fdF43pW1Lu0GCW76xn/8+M
 noINord7/9qrg4PyEBpxRlBXAbD9GejVdDP146wF5gdQAy7TAcotaF6IsGaLCf/Nh8CnEvHr64Q
 huYTT0JeHNCuoPXI=
X-Received: by 2002:a05:651c:2208:b0:290:5101:bb85 with SMTP id
 y8-20020a05651c220800b002905101bb85mr2980763ljq.6.1675087484480; 
 Mon, 30 Jan 2023 06:04:44 -0800 (PST)
X-Google-Smtp-Source: AK7set9JI9Yk2VwOFSaqNpDbZpC4ifVf/ChVYRs9OQKROWaX7rHRqKTaRmmuO6ANC/OVr8w40d4KmA==
X-Received: by 2002:a05:651c:2208:b0:290:5101:bb85 with SMTP id
 y8-20020a05651c220800b002905101bb85mr2980733ljq.6.1675087484135; 
 Mon, 30 Jan 2023 06:04:44 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 u9-20020a05600c4d0900b003dc54eef495sm4543215wmp.24.2023.01.30.06.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 06:04:42 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Jiang Jiacheng <jiangjiacheng@huawei.com>
Cc: <qemu-devel@nongnu.org>,  <berrange@redhat.com>,  <dgilbert@redhat.com>,
 <yubihong@huawei.com>,  <xiexiangyou@huawei.com>,
 <zhengchuan@huawei.com>,  <linyilu@huawei.com>
Subject: Re: [PATCH 3/3] migration: save/delete migration thread info
In-Reply-To: <b059cf27-73dd-addf-58bb-2078c3aa985f@huawei.com> (Jiang
 Jiacheng's message of "Mon, 30 Jan 2023 20:49:11 +0800")
References: <20230120084735.825054-1-jiangjiacheng@huawei.com>
 <20230120084735.825054-4-jiangjiacheng@huawei.com>
 <87k014odby.fsf@secure.mitica>
 <b059cf27-73dd-addf-58bb-2078c3aa985f@huawei.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 15:04:42 +0100
Message-ID: <87357sp18l.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

Jiang Jiacheng <jiangjiacheng@huawei.com> wrote:
> On 2023/1/30 12:28, Juan Quintela wrote:
>> Jiang Jiacheng <jiangjiacheng@huawei.com> wrote:
>>> To support query migration thread infomation, save and delete
>>> thread information at thread creation and end.
>>>
>>> Signed-off-by: Jiang Jiacheng <jiangjiacheng@huawei.com>
>> 
>> Don't disagree with this, but if we create this on the sending side, why
>> this is not needed for the multifd_recv_threads?
>> 
>
> I only add several threads which i'm interested in into the list till
> now, whose information will be used for setting cpu affinity for
> migration thread.
> For consistency, we can add other threads to the list, but those
> information won't be used so far.

It is just curiosity, why do you want to set cpu affinity on the source
but not on destination?

Later, Juan.


