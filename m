Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 024636E77B7
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 12:48:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp5Li-0002eP-Fj; Wed, 19 Apr 2023 06:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pp5Lf-0002dq-Nn
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 06:47:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pp5Le-0003JB-8P
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 06:47:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681901257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Shff5UHGpCJtk9CwhMXtvFCR6d+rBXmVr8+KsLhO9g=;
 b=db1ipojKXfobdD5COuBvB26N9Q/50bh0FdJpB4QTgFEr7qk0jCi4PQb2P6WgVHdldGgHWn
 gSR4D5cQ/BXuLgVFSd5szbP6fQKsQcutntC1+xtPcr5i+IcIVsxB45F224jGvURRtTq+2e
 Uh+OZGRAzKMUBbT0Hd7a1dREMbvxZcQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-7dsF-2BDOvSI8StWeqqy0Q-1; Wed, 19 Apr 2023 06:47:35 -0400
X-MC-Unique: 7dsF-2BDOvSI8StWeqqy0Q-1
Received: by mail-ed1-f72.google.com with SMTP id
 d2-20020a50f682000000b0050503f2097aso11473953edn.14
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 03:47:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681901254; x=1684493254;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/Shff5UHGpCJtk9CwhMXtvFCR6d+rBXmVr8+KsLhO9g=;
 b=XqYfNFOCbr3TBGRsgZSTRXnxpnAe9zamw7xWnaERcoljrte7OgevuR2IhO1pYOUMNK
 uPKKOE0BqrMnd74eisAbZKa7L7IRq/b/oSRDgwUeTBcMBhkmp9AHQGr9dZiPlloqrnQ/
 7cI85TV5I/eMdZjG1oHrBOBIvVaZ9rhzjGalyC1hhdawodDbKDluE2ATUO7Sy2DcMUzZ
 D/uBCFhaeY6PCEi8nZg9tDVVLeqEfS43YNkTGZMs65bT87LX+BQOtZ4/HUAK9MJPyQC0
 3pBCisUEfRzT9dERZyRIkgSKQrz3iCmyvSQnRSWHrtb1b0TXCTfTSJd09i2fxCzPgs8F
 K5JQ==
X-Gm-Message-State: AAQBX9fakJpzPCCN4q5UzhKmm+65J5WMVfn0wmZt5Z1RObbC10N3CnhF
 M90jRsLRdWUTklKhQ01lrmagH9JHVyzlMBHGWz9iSWyIXPAcOB3ol0m3Fw5XwdWnhuw8MvBBu7L
 46ss7bSBEcDg2aiY=
X-Received: by 2002:a17:907:d01:b0:94f:1ce7:1864 with SMTP id
 gn1-20020a1709070d0100b0094f1ce71864mr15347160ejc.38.1681901254547; 
 Wed, 19 Apr 2023 03:47:34 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z21UzsckTqq095K46EG8crMw8ho+UwmiOlX66PH0RLTxHj8mLmYeClPOtcMaVNcZQz3xO9AA==
X-Received: by 2002:a17:907:d01:b0:94f:1ce7:1864 with SMTP id
 gn1-20020a1709070d0100b0094f1ce71864mr15347140ejc.38.1681901254296; 
 Wed, 19 Apr 2023 03:47:34 -0700 (PDT)
Received: from ?IPV6:2003:cf:d71b:cc43:1955:48c6:4ddb:556c?
 (p200300cfd71bcc43195548c64ddb556c.dip0.t-ipconnect.de.
 [2003:cf:d71b:cc43:1955:48c6:4ddb:556c])
 by smtp.gmail.com with ESMTPSA id
 mm14-20020a170906cc4e00b0094f507aa0e9sm5115305ejb.19.2023.04.19.03.47.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 03:47:33 -0700 (PDT)
Message-ID: <fb311ad4-ba1e-afc8-801d-0eff00c7fa7f@redhat.com>
Date: Wed, 19 Apr 2023 12:47:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/4] vhost-user: Interface for migration state transfer
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, German Maglione <gmaglione@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-3-hreitz@redhat.com> <20230412210641.GC2813183@fedora>
 <CAJaqyWfm=g_hr9=WpsnwJ4hdpVb7K7p5rirWjvx=PxKYUp8trA@mail.gmail.com>
 <d9d67f07-3d4c-9bdb-052b-28e21fa27dd6@redhat.com>
 <20230417151250.GC3852722@fedora>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230417151250.GC3852722@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.597, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 17.04.23 17:12, Stefan Hajnoczi wrote:

[...]

> This brings to mind how iterative migration will work. The interface for
> iterative migration is basically the same as non-iterative migration
> plus a method to query the number of bytes remaining. When the number of
> bytes falls below a threshold, the vCPUs are stopped and the remainder
> of the data is read.
>
> Some details from VFIO migration:
> - The VMM must explicitly change the state when transitioning from
>    iterative and non-iterative migration, but the data transfer fd
>    remains the same.
> - The state of the device (running, stopped, resuming, etc) doesn't
>    change asynchronously, it's always driven by the VMM. However, setting
>    the state can fail and then the new state may be an error state.
>
> Mapping this to SET_DEVICE_STATE_FD:
> - VhostDeviceStatePhase is extended with
>    VHOST_TRANSFER_STATE_PHASE_RUNNING = 1 for iterative migration. The
>    frontend sends SET_DEVICE_STATE_FD again with
>    VHOST_TRANSFER_STATE_PHASE_STOPPED when entering non-iterative
>    migration and the frontend sends the iterative fd from the previous
>    SET_DEVICE_STATE_FD call to the backend. The backend may reply with
>    another fd, if necessary. If the backend changes the fd, then the
>    contents of the previous fd must be fully read and transferred before
>    the contents of the new fd are migrated. (Maybe this is too complex
>    and we should forbid changing the fd when going from RUNNING ->
>    STOPPED.)
> - CHECK_DEVICE_STATE can be extended to report the number of bytes
>    remaining. The semantics change so that CHECK_DEVICE_STATE can be
>    called while the VMM is still reading from the fd. It becomes:
>
>      enum CheckDeviceStateResult {
>          Saving(bytes_remaining : usize),
> 	Failed(error_code : u64),
>      }

Sounds good.  Personally, I’d forbid changing the FD when just changing 
state, which raises the question of whether there should then be a 
separate command for just changing the state (like VFIO_DEVICE_FEATURE 
..._MIG_DEVICE_STATE?), but that would be a question for then.

Changing the CHECK_DEVICE_STATE interface sounds good to me.

Hanna


