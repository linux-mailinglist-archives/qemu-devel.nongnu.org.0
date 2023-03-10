Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB36E6B4811
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 15:58:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paeB4-0001yZ-0E; Fri, 10 Mar 2023 09:57:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1paeB1-0001yH-Cx
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 09:56:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1paeAz-0005xG-V8
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 09:56:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678460216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8+o8b4GH+i296qpI6VR1g2WiT5meTG+wEjw4VNa6FZU=;
 b=FYVSFsPadSOwtHTA9pgKYaAVFQIgbjiFQ/2h7D+YBHBfyKSgo5FII4NRpjYJ8+SwCollnE
 i8QfKZFz12qvZX8GDGpdlA3I0L14eZ/oPP4Zkj02PAzeSUy2lBeYPwF3ftV8XKv/1PNvBp
 +WXg73p0hY4QtwhKyz6/Ur4mzn+lmv4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-kvUTGqMSNYKz6cEVktM0zQ-1; Fri, 10 Mar 2023 09:56:55 -0500
X-MC-Unique: kvUTGqMSNYKz6cEVktM0zQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 x14-20020ae9e90e000000b007429af46d5eso3171340qkf.12
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 06:56:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678460215;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8+o8b4GH+i296qpI6VR1g2WiT5meTG+wEjw4VNa6FZU=;
 b=OuNkhe2tYJMfCQuhby1yc6ndwbDG3Y+735rFooa7yTEeQnI13W0oXHFgZf6G5x28Hk
 tR5OBi9BeWbX9ILa4WczVFS3AEt8ou1sZoM63vj63dhJ9lRRqS2zD00PlAq8sntRCpkF
 Yv4cDVCjw+BJGv4waZTymkPo/QrSRa6Bxm5cWgwm0KuKiQJLfdi7fSTOdmTzdJBTeWzh
 1C8+EqfoDXGowgLyClIDIFOSYtlYztorFg2DGfIQhJ2h8GAC6Ypc1yNW4g6zwBBdH5a4
 1mUhDu4XztCyYWlTQFsZKbNleuWg7nIxEKLucvjUa2fk2m1SAv7tNAK9SVwuNqZa1Qko
 8vAg==
X-Gm-Message-State: AO0yUKUrBnH97hKC0E4pC/lAMzIGImsLdy2JyHfXJ0QSnS4x7n9XeI7B
 s8WodqaKYXpPqrcVyyaFnbumJdMy9z0EG6VLOfC8hd4QRbZ70JbRW60IAktxVszFDcymKAjbr7H
 JfJoTdjHnFSxHfd8=
X-Received: by 2002:ac8:7d4d:0:b0:3bf:a60d:43b9 with SMTP id
 h13-20020ac87d4d000000b003bfa60d43b9mr12578688qtb.4.1678460215078; 
 Fri, 10 Mar 2023 06:56:55 -0800 (PST)
X-Google-Smtp-Source: AK7set9f5X4F8/R9mAO9dKsuDQDiYAcRZMRGK2DT2gsVPZunXCaIcXXdaDHw1prCbmo9KKo2sj50iQ==
X-Received: by 2002:ac8:7d4d:0:b0:3bf:a60d:43b9 with SMTP id
 h13-20020ac87d4d000000b003bfa60d43b9mr12578650qtb.4.1678460214744; 
 Fri, 10 Mar 2023 06:56:54 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 he4-20020a05622a600400b003b646123691sm1488396qtb.31.2023.03.10.06.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 06:56:54 -0800 (PST)
Date: Fri, 10 Mar 2023 09:56:52 -0500
From: Peter Xu <peterx@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com,
 pbonzini@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: Re: [PATCH v7 4/6] memory: Add sanity check in
 address_space_to_flatview
Message-ID: <ZAtFNB5RaU5ywCnY@x1n>
References: <20230310022425.2992472-1-xuchuangxclwt@bytedance.com>
 <20230310022425.2992472-5-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230310022425.2992472-5-xuchuangxclwt@bytedance.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Mar 10, 2023 at 10:24:23AM +0800, Chuang Xu wrote:
> Before using any flatview, sanity check whether BQL or rcu is held. And
> if we're during a memory region transaction, try to immediately update
> mappings, or the map can be invalid.

Sorry I didn't read into details in the previous version.  This subject and
commit message all need update.  It's not only about sanity anymore.

We need to state the major change to address_space_to_flatview() to allow
triggering do_commit() during a very large memory transaction, also on why
you did it.

IMHO it's because we find it's beneficial for speeding up vm load if wrap
the vm load into a whole memory transaction.  The whole point is vm load
contains far more memory updates than referencing to a specific address
space / flatview, hence this nested do_commit should logically only be
triggered in a few spots during vm load.

Thanks,

-- 
Peter Xu


