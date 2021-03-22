Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BC33446E3
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 15:16:14 +0100 (CET)
Received: from localhost ([::1]:58356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOLLp-00019M-PG
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 10:16:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lOL3l-0008K7-7U
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:57:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lOL3h-00025f-8w
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:57:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616421447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ustw7zb9xwoTY62KIwTLoJSZNgkkybyahdV3iD0vRF4=;
 b=UOgbzCVi7fwuZf0s9DEIxbg1HffBFLCytMQAQpV0rofRTVQFHzM7nP2yDpdhjYd2Y6g+kM
 ZJao3SNKIwLNEwESvGTUbjV3+xOeX1/E6lz/qLdGpCEOaKLLuZtweWDQmSMlLMSFKVYX1T
 mqnY97MoxppAJxhXks9yGnkNPnIGKPw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-6haV9A9TNx6CFR5Y4-_ATw-1; Mon, 22 Mar 2021 09:57:24 -0400
X-MC-Unique: 6haV9A9TNx6CFR5Y4-_ATw-1
Received: by mail-wr1-f72.google.com with SMTP id 75so25888290wrl.3
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 06:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ustw7zb9xwoTY62KIwTLoJSZNgkkybyahdV3iD0vRF4=;
 b=PyLt0CNEpMZYcrVuWu4WlbTEtSHEVp9NyiHZaBxApNROHjpcSf2F+xqXyNAVyFZ5Zu
 FrYkU8dY0PiBp5JHl56uKxJg2fwPpeobEYZWPx/cB+VCH/0VJAmnSa5N4WimZ6XGekeJ
 woh5noNcUtjcOErz0JJLRNz5QZJm410WFBrFlluXHoo07VGNM9EIHwrTlxb6G1gcKpsR
 a79k+YJIwi28ztiUI3U0g8LNgqO5zS3M0Rwrp7yYIR3Al7vdzAJ2+YAZ5CkhcczGq8st
 P2mVUFPn52iOMXf6EkFYIIow6p2jLdred3Bk3Gda5QpXHVpeJVW38Y1f7ylUolQXMBGp
 1ceg==
X-Gm-Message-State: AOAM532RX3AAh+8zBOFRvKuhzojOKwvZeGHzKZxDqvSKIYQFKpILde5W
 D3ZG1NmOMY80PoxO3eEwoGPuSJhOwzqoGxFgR38bJJZYkNB0LzfzoX+weoeOM9eazx1ejCS/rLB
 gOE/k3xoxjpF6wrU=
X-Received: by 2002:a5d:4743:: with SMTP id o3mr18594612wrs.108.1616421442643; 
 Mon, 22 Mar 2021 06:57:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtiCEP2CglOV1czOwBOJifQWlxAsQ4EUUNu0m6ROK87qi49+5dNNhPkdW2tMjI+MaATz4w4A==
X-Received: by 2002:a5d:4743:: with SMTP id o3mr18594597wrs.108.1616421442485; 
 Mon, 22 Mar 2021 06:57:22 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id v18sm21123448wru.85.2021.03.22.06.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 06:57:21 -0700 (PDT)
Date: Mon, 22 Mar 2021 14:57:19 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PULL 18/76] optionrom: add new PVH option rom
Message-ID: <20210322135719.z34fei3aawcr4x7z@steredhat>
References: <1549390526-24246-1-git-send-email-pbonzini@redhat.com>
 <1549390526-24246-19-git-send-email-pbonzini@redhat.com>
 <e3d925e6-a48e-07b9-6418-05c5a4d2cd36@redhat.com>
 <f33bf6fa-1fa3-4e33-bd8e-843bec2d5638@redhat.com>
 <20210319173524.rnrxslpmdjck6uxv@steredhat>
 <CABgObfZHP1aSMpbdWh6TwCN_D5gy5TS5+Q7-La8d7E5czvn7Rg@mail.gmail.com>
 <20210319182022.veha5gbcg3p4idgk@steredhat>
 <CAGxU2F7hNoJeDpsCtU0ypKd=3+3mrxcc3QU6Yx9SK9e_7y6Khw@mail.gmail.com>
 <CAGxU2F5x_TNQZJ3f+baam3pHzzP+0k57FFNB5ms-qt3B25gSVQ@mail.gmail.com>
 <c7f0fb65-5d9b-9b38-8348-30eaa5ff5594@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c7f0fb65-5d9b-9b38-8348-30eaa5ff5594@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 22, 2021 at 12:52:37PM +0100, Paolo Bonzini wrote:
>On 22/03/21 11:59, Stefano Garzarella wrote:
>>
>>If I build with gcc 10.2.1 20210313 (Alpine 10.2.1_pre2) uint64_t and
>>UINT64_C(1) have a size of 4 bytes, while UINT64_C(0x2052545020445352)
>>has a size of 8 bytes:
>>
>>    warning: initialization of ‘char (*)[4]’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
>>    74 |     char (*__size1)[sizeof(uint64_t)] = 1;
>>       |                                         ^
>>    warning: initialization of ‘char (*)[4]’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
>>    75 |     char (*__size2)[sizeof(UINT64_C(1))] = 1;
>>       |                                            ^
>>    warning: initialization of ‘char (*)[8]’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
>>    76 |     char (*__size3)[sizeof(UINT64_C(0x2052545020445352))] = 1;
>
>Looks like long is 4 bytes long with -m16 and -m32, but 8 bytes with 
>-m64.  The large constant is extended to long long because it's the 
>only way to fit it.

Yeah, but I expected uint64_t to always be on 8 bytes, regardless of the 
architecture.

Stefano


