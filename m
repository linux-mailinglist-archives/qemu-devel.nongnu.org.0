Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 765C03999AF
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 07:17:02 +0200 (CEST)
Received: from localhost ([::1]:41790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lofj3-000615-1x
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 01:17:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lofi2-000596-9j
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 01:15:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lofhy-0004ik-R1
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 01:15:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622697352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NF7BbDNEmt5kCPFhivpaabrNBSzSfGcarJNMqjVtwNI=;
 b=WJ6GAybWESh64oB0Hi/iBgBbYKX+AWql1CYE8P/LH08ZAlqWPAMKbn9v9va5BgkZdZi4VQ
 UBSoYw4NFogTu5pAROSgS+3Mkcc2yh6N2807jhIOTa1732WapFmzT/J4c/axXtpzS6EIy2
 /jHmaKfhjGuW8Cdg3kngNL9WuNplFiM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-DKc81s1FOoGOLgNtZKtBKA-1; Thu, 03 Jun 2021 01:15:50 -0400
X-MC-Unique: DKc81s1FOoGOLgNtZKtBKA-1
Received: by mail-wm1-f72.google.com with SMTP id
 j6-20020a05600c1906b029019e9c982271so2982362wmq.0
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 22:15:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NF7BbDNEmt5kCPFhivpaabrNBSzSfGcarJNMqjVtwNI=;
 b=iuiZXroXeOYn2zSjTrdCsMs5pnv8tYfeaq/YGRKz2aLLS/IDBMnVBca1pQ5ka3R8Tu
 hBKHNJKk0G/TjQqJjPY4Su9Q5ko62QfAsjq0dXSWKhDtEWOPAAr+zjpncEKQC4+N03kt
 6NrkQXYpIZ0OgdEwZBiqgHSEFQIqbrBwTGeg1Yzbc369/hB1i9yCLfCSeBOs7f7NJibJ
 gzCZL56zvie+6pe77a8/VknJfpxjEcdyGUtCIEm0869w0PLiscQzhilBRLS4tWhohzmM
 U/wTGBl6yAnXMIcVf0k3owqOxI7yALuDe2pDlyaemRnMtB2oaGPiXmOz0TxL2971m242
 n8pA==
X-Gm-Message-State: AOAM53238oZmskcC1onoHymD7uE1jVhTavkxjHrjtoGmgnaSDzwCbz9J
 BjY/DgdnrqgR6sRQthpgSsop+sik0TDwS8I/YFY2BtEdsGJvVo0Pd5MxhNxC//NXfYf9M8YWD8e
 n8xpgeiTcQS3NHAkDG1HZCwfTCztmvSG6v9OPXIhRMY76RRlJlWQud/HBgbV0nnc=
X-Received: by 2002:a05:600c:410c:: with SMTP id
 j12mr12479932wmi.117.1622697349509; 
 Wed, 02 Jun 2021 22:15:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1mXTL54cqBzeMTEcwGhAHBOi+lAITLBoKiHPGaEggSy4dx+/zFjMG4klONG/Arwx4p2eL7A==
X-Received: by 2002:a05:600c:410c:: with SMTP id
 j12mr12479905wmi.117.1622697349227; 
 Wed, 02 Jun 2021 22:15:49 -0700 (PDT)
Received: from thuth.remote.csb (pd9575772.dip0.t-ipconnect.de.
 [217.87.87.114])
 by smtp.gmail.com with ESMTPSA id h14sm4410984wmb.1.2021.06.02.22.15.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 22:15:48 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] GitLab: Add "Bug" issue reporting template
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210603001129.1319515-1-jsnow@redhat.com>
 <20210603001129.1319515-2-jsnow@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <63c9c30a-68c4-60a6-f65f-866301a25e8d@redhat.com>
Date: Thu, 3 Jun 2021 07:15:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210603001129.1319515-2-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/06/2021 02.11, John Snow wrote:
> Based loosely on libvirt's template, written by Peter Krempa.
> 
> CC: Peter Krempa <pkrempa@redhat.com>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   .gitlab/issue_templates/bug.md | 63 ++++++++++++++++++++++++++++++++++
>   1 file changed, 63 insertions(+)
>   create mode 100644 .gitlab/issue_templates/bug.md

Reviewed-by: Thomas Huth <thuth@redhat.com>


