Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A641F3ECE3F
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 08:02:16 +0200 (CEST)
Received: from localhost ([::1]:48460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFVhP-0008Sx-Ng
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 02:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mFVgA-0007g1-BP
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 02:00:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mFVg6-0000gv-Fw
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 02:00:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629093653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B1guoCsaKsxFSet6R+oycGVauhZFDJ7/WInthCuAaWk=;
 b=Q3PqX39+L3RJibG2GaqPqBkKz4LwMlS81a5Hkg4mVIrMJ/r81DlSFXN0PUv4UyBoR9kjiE
 4HftTPsPkaZUwD2yMqcEBcUyNDSYoKVFb8X9Ccj5sxgQio/j50q+X/KIpwCIem4uIbZAqv
 qGNUtimjRCp5ie5owl0ux8gpDRG0buQ=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-WWbqMpSAPlyk1BezakFkdQ-1; Mon, 16 Aug 2021 02:00:51 -0400
X-MC-Unique: WWbqMpSAPlyk1BezakFkdQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 v9-20020a17090a7c09b02901778a2a8fd6so16044085pjf.3
 for <qemu-devel@nongnu.org>; Sun, 15 Aug 2021 23:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=B1guoCsaKsxFSet6R+oycGVauhZFDJ7/WInthCuAaWk=;
 b=Zl8gUtWHbKjZXF8bg/BsL1S+lfeV7g/3TKPLZYGEunF2wHT60UKspkN480AjEK40iw
 KT9i7EDM3VbZP0p5JpP1id3WM3eA5MBmfBMDLYLwrjabPhEZmNVSIqLZyqj4P31hY5Cw
 mwPgwmvFXHi/xIDJVEH1FKxDj5z32NJKk1RTmrAbuKSYfSuBfUEytjZgTmI+i1scoWs8
 r73FFVn/CbfxCZ5B3rDxKH8M9NtL4GWkLvTyzQj0CXP0nNUScKKbFBtnr+2pq8lUt36f
 CXfJzGv4K5+onab7X7GykmR1EweWOaBBWk58Eq50wwXPYw/mOl3qvW1UR8O4AL//5AR8
 LZtw==
X-Gm-Message-State: AOAM533mhQHH7pZRa2vaa6QWkR9a5d/vmEavXh10vgh51KlAllal9J/k
 uDjWZd2jYANJ1UzgA0Uojb2wKGPLRflfzgUFjYizF/mMBh4ndndY7KdrNTxrX8n0utHu0/6vgsm
 5J/AOFRMRT4igCFg=
X-Received: by 2002:a17:90a:8405:: with SMTP id
 j5mr10796921pjn.160.1629093650703; 
 Sun, 15 Aug 2021 23:00:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwECihGOM1NHREbS9fFtT9+Skl6D0E5/LPSENCd7c65RRUNEDzQ34V80dhnWZm6SSq1ZoCKwA==
X-Received: by 2002:a17:90a:8405:: with SMTP id
 j5mr10796905pjn.160.1629093650478; 
 Sun, 15 Aug 2021 23:00:50 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id p30sm9649154pfh.116.2021.08.15.23.00.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Aug 2021 23:00:50 -0700 (PDT)
Subject: Re: [PATCH v3] vhost-vdpa: Do not send empty IOTLB update batches
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210812140933.226288-1-eperezma@redhat.com>
 <CACGkMEsqs28TAFb6ZnXM5XQwFmjqzj2LkR1fQZXVhs=13AGKsQ@mail.gmail.com>
 <20210816013610-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9e3949a3-11f3-ae2a-f6d4-7ebe440f5a6e@redhat.com>
Date: Mon, 16 Aug 2021 14:00:46 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210816013610-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-2.147, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>,
 Eli Cohen <elic@nvidia.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/8/16 ÏÂÎç1:36, Michael S. Tsirkin Ð´µÀ:
> On Mon, Aug 16, 2021 at 10:51:57AM +0800, Jason Wang wrote:
>> On Thu, Aug 12, 2021 at 10:09 PM Eugenio P¨¦rez<eperezma@redhat.com>  wrote:
>>> With the introduction of the batch hinting, meaningless batches can be
>>> created with no IOTLB updates if the memory region was skipped by
>>> vhost_vdpa_listener_skipped_section. This is the case of host notifiers
>>> memory regions, device un/realize, and others. This causes the vdpa
>>> device to receive dma mapping settings with no changes, a possibly
>>> expensive operation for nothing.
>>>
>>> To avoid that, VHOST_IOTLB_BATCH_BEGIN hint is delayed until we have a
>>> meaningful (not skipped section) mapping or unmapping operation, and
>>> VHOST_IOTLB_BATCH_END is not written unless at least one of _UPDATE /
>>> _INVALIDATE has been issued.
>> Acked-by: Jason Wang<jasowang@redhat.com>
> Oops. You missed by pull request by a hairwidth.


It's fine.

Thanks



