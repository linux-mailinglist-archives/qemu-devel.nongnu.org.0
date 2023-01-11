Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D69B6658C2
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 11:14:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFY7U-0001Lk-3m; Wed, 11 Jan 2023 05:14:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pFY7R-0001L7-LQ
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 05:14:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pFY7Q-00047W-AQ
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 05:14:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673432042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bJsHHs1F8wKM5FZiZb24/FG1NQWFNkip8dPI6KDq1yA=;
 b=Cxh1JODYgWBkSLXkD1CFUDazBiD4WylmdSpNVBL1+a0+3ZTb3WQPTNk91nc4hWw80s8o2h
 vwoW2fdBmbyyr1NgSmj6+tSx8aJQiY7CT8VP01SRQOL1Hizet8uaRUYgdiWQ3lEmqX5hB3
 detu0yQx02v8oPR0xgJoxXxVYjqDjdA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-422-_qj2wBEQNuSBnNhO9_Zfpg-1; Wed, 11 Jan 2023 05:14:01 -0500
X-MC-Unique: _qj2wBEQNuSBnNhO9_Zfpg-1
Received: by mail-wm1-f69.google.com with SMTP id
 fm17-20020a05600c0c1100b003d96f0a7f2eso10470974wmb.6
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 02:14:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bJsHHs1F8wKM5FZiZb24/FG1NQWFNkip8dPI6KDq1yA=;
 b=6QirDqiDRA2HjNEeRoI/Ldbovp9RYtavv/J0rah22tyS3BxKTZ5EKlYAKtHsg+nKaQ
 P29e3NfHZBVok8oRCrfRAnU++nJluWyi4cYzK277GUWw7LSuMyjTnGtRDCWO2OpA1u2a
 lgoLZhvFsnBtYdlLPj7IoiXrg06vTofvqkLD3InRNdJ6t6fVvB3EiKlgD1y3OwzEfyaM
 S7neu7+BtGBxAJ4l+VlT787V3vjaSK87ohTejgq6AQ1l5I/wGozDX/LccAdEwci15wk4
 km/j3Bwa+cIRd1kFI1MCxnqUF/4Aq5byl0VoTklhjxgepfcNhk9TSlNrkzSQuaW4TxXn
 Dduw==
X-Gm-Message-State: AFqh2krI57Mo72eH7OBRUD0AY7wzJLF7XvS8vXjEtoJss7m9YgXcKjhj
 I9fHDMr/j7JHbtr6h5JaapvXrGIBfKMpTeViPqeJolYbdU0qTl1+AfhdTzvXyk3gB6XiMcB6+oM
 BSFxMpZskqe7lkuI=
X-Received: by 2002:a05:600c:35d4:b0:3d2:2d2a:d581 with SMTP id
 r20-20020a05600c35d400b003d22d2ad581mr51046923wmq.30.1673432040293; 
 Wed, 11 Jan 2023 02:14:00 -0800 (PST)
X-Google-Smtp-Source: AMrXdXte/L7HpWHH6ZpDEJAprYJr/vGPwAZg126M3b/w3PAMzJzs4fXLJb27pTrhH+ctAR49MmP54A==
X-Received: by 2002:a05:600c:35d4:b0:3d2:2d2a:d581 with SMTP id
 r20-20020a05600c35d400b003d22d2ad581mr51046907wmq.30.1673432040026; 
 Wed, 11 Jan 2023 02:14:00 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:5b00:5b3c:db46:8eb5:ee24?
 (p200300cbc7045b005b3cdb468eb5ee24.dip0.t-ipconnect.de.
 [2003:cb:c704:5b00:5b3c:db46:8eb5:ee24])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c4f8900b003d96b8e9bcasm24698080wmq.32.2023.01.11.02.13.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 02:13:59 -0800 (PST)
Message-ID: <dc6a0bf0-298e-8352-018f-2b7ca9e685a9@redhat.com>
Date: Wed, 11 Jan 2023 11:13:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/7] target/s390x: Pass S390Access pointer into
 access_prepare
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230109201856.3916639-1-richard.henderson@linaro.org>
 <20230109201856.3916639-3-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230109201856.3916639-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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

On 09.01.23 21:18, Richard Henderson wrote:
> Passing a pointer from the caller down to access_prepare_nf
> eliminates a structure copy.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


