Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 985DE2C05CB
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 13:35:03 +0100 (CET)
Received: from localhost ([::1]:60492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khB3e-0005v1-N4
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 07:35:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1khB1e-0005KS-FD
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 07:32:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1khB1c-0004ZS-Sr
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 07:32:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606134774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MaIlHfjRqv4c52sDZK9y04UeY+JG1O9rpEiiGTequps=;
 b=N7XhagW/10sAhTfv+7pfioMOKuCLQ0I1pzRXkQ+yJS/vbCljIHx7vsDrDkWO9id5feqZJu
 PJrDj6cYY8AYd7gz5iuhJxtyoYMaIw2bQnWnwRL68OiT5ky5UPNdBDt3AczskHIaAR+uXh
 DkPv7xST1Raq2btBiE6jQ+au0+pIw/w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-erO9PuSqOO6LHC75m3Hoqg-1; Mon, 23 Nov 2020 07:32:53 -0500
X-MC-Unique: erO9PuSqOO6LHC75m3Hoqg-1
Received: by mail-wm1-f69.google.com with SMTP id o203so4998171wmo.3
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 04:32:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MaIlHfjRqv4c52sDZK9y04UeY+JG1O9rpEiiGTequps=;
 b=XoxkkdfIU0uDLyql1xnkpafTGUQkmWDLdGVVfxHFpPz1sNCHtloej7v2tmQrvsroTp
 wogHm0759YjucKpDhDOy0/EHqz6xIA1/dqvIcNVAEJzdNe57AXr3Q/endMMb89AuaDyg
 xOU3QumI8jI21SdLZYKvHvzGAkRjBffPlonGDnHEZlvBrFPwywRzlX8bbQP5gZxhAnn3
 e/lskks6ujsLJi0L48G8vMMMfuvV2HbNaufwlPgYZzm5xXj9JFyo9TKhDbTWvCIz+fy6
 +ETxF9LZfenQJm9St4PdmPzy6NJxt3Jb+3ABD6ecLdDoscDjpT5QVAyWoPR1fqtDdnEf
 +LdQ==
X-Gm-Message-State: AOAM533R6Vo5s3+b1sddQeJfmKN2ybZtt8GhXllPJ/0oNNMeC8+nTp+B
 sZdSfN3+GciYoyCXGSu0MFb4CP8tucvFpbAe5O8S9YWNW1YZxLeZhaYNkDEcaCmmu/94c2R8f8s
 Ry6Yfw5fGLAuYGlM=
X-Received: by 2002:adf:f083:: with SMTP id n3mr30455450wro.391.1606134772164; 
 Mon, 23 Nov 2020 04:32:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7Ur6KJicKM1aJ9nMkwe5SvdUIb5ap0HLBdLn5/ffzppslYYo21zyUQfN8MrjW7wglbL6k9w==
X-Received: by 2002:adf:f083:: with SMTP id n3mr30455440wro.391.1606134771998; 
 Mon, 23 Nov 2020 04:32:51 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id q5sm20688136wrf.41.2020.11.23.04.32.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 04:32:51 -0800 (PST)
Subject: Re: [PATCH-for-6.0 0/2] hw/scsi/scsi-disk: QOM style change
To: qemu-devel@nongnu.org
References: <20201106170404.4130486-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5370d9aa-702e-a973-a45d-b8b5067e3046@redhat.com>
Date: Mon, 23 Nov 2020 13:32:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201106170404.4130486-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 11/6/20 6:04 PM, Philippe Mathieu-Daudé wrote:
> Some QOM style changes in TYPE_SCSI_DISK to follow
> the rest of the codebase style. No logical change.
> 
> Philippe Mathieu-Daudé (2):
>   hw/scsi/scsi-disk: Rename type as TYPE_SCSI_DISK
>   hw/scsi/scsi-disk: Use SCSI_DISK_GET_CLASS() macro
> 
>  hw/scsi/scsi-disk.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 


