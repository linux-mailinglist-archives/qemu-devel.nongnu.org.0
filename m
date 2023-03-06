Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C106AC158
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:35:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZAwj-0007C2-Ue; Mon, 06 Mar 2023 08:32:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZAwd-0006xv-Rl
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:32:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZAwc-0007md-Ib
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:32:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678109521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mbnG/TdhIZseXFyfbeaV12irrNZqUSFLC6mTYOuyqFE=;
 b=fVn4QZ/BtTyklnD4G1pXn18wajlp356xkxWkzRPPkgaru/d0lLqU2+LCAkN6mXwxAEu5pE
 49QzBXoBMoAKke8OIQnAJ/IYBZ8Af3tORoAq7OcY10VvtobGTQH+9P5qLxCSdoKUfPXiS3
 NAzeCd7C6mK/zefRRipunNtiaRzZQUQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-x4-hjADSOFSv4CRwpMVVqA-1; Mon, 06 Mar 2023 08:32:00 -0500
X-MC-Unique: x4-hjADSOFSv4CRwpMVVqA-1
Received: by mail-wm1-f69.google.com with SMTP id
 k36-20020a05600c1ca400b003eac86e4387so6747415wms.8
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 05:32:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678109519;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mbnG/TdhIZseXFyfbeaV12irrNZqUSFLC6mTYOuyqFE=;
 b=kUXe5LWPxgt5g6X8Kmx0iQD+DWYndrla4y7TmFqCsnIAesv6qQ6CG7IwF6wPREHK44
 a0Y6dLTQQ+ln8A7PZZyyRGOevpuQDwlQDkOupuZ+PJ7hn7Tslz+uYDjmmn0wP2u5j6Uc
 9s8U0EdajqxNJHgDof3ecPNx8FzQ8q7+Bzrj06B8jVQRUS7iE9zuVY2QY73q3GwrOydS
 KYuSfBR2jvNuwwThGLmi1EmPNC4jUM/4ItzSfTcTGmVJdM7W3NFjs4Tav6ICCqPcxPKs
 n2Zps0YyQCArBAGi1UFuN0XNrsNrRgKIvBSXu84o9D5gpTIdNpZS3SryqWdN9PlHcii7
 IkYw==
X-Gm-Message-State: AO0yUKUBt7KEEdAdQ8jRedVjuOQnVghjHaWQQsit3e5YGZxCCFeUdkBd
 wlQKxjpswVB5sWWyuoQHl+ZCPz+w/0bmJyouxdgXHQ5Oqly73ZNO6GRYBhsB+gMmEbGEQvqwAZ0
 sUpNT1Bc3qHT6vNQ=
X-Received: by 2002:adf:ec47:0:b0:2c7:e48:8ca3 with SMTP id
 w7-20020adfec47000000b002c70e488ca3mr7077352wrn.0.1678109519515; 
 Mon, 06 Mar 2023 05:31:59 -0800 (PST)
X-Google-Smtp-Source: AK7set/Hg3iwlrQuenJbSgoCxrb5JIoyBOKCEPi7O+yurYei4iTQY2WGmc9qYcdQnyjxZjDNr111ag==
X-Received: by 2002:adf:ec47:0:b0:2c7:e48:8ca3 with SMTP id
 w7-20020adfec47000000b002c70e488ca3mr7077341wrn.0.1678109519322; 
 Mon, 06 Mar 2023 05:31:59 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:3500:b8a3:191c:eae:cc05?
 (p200300cbc7043500b8a3191c0eaecc05.dip0.t-ipconnect.de.
 [2003:cb:c704:3500:b8a3:191c:eae:cc05])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a5d4c45000000b002c55306f6edsm9557224wrt.54.2023.03.06.05.31.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:31:58 -0800 (PST)
Message-ID: <4e06d45f-abd2-046f-042a-dc3d3c05d721@redhat.com>
Date: Mon, 6 Mar 2023 14:31:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/8] edu: add smp_mb__after_rmw()
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 cohuck@redhat.com, eauger@redhat.com
References: <20230303171939.237819-1-pbonzini@redhat.com>
 <20230303171939.237819-5-pbonzini@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230303171939.237819-5-pbonzini@redhat.com>
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

On 03.03.23 18:19, Paolo Bonzini wrote:
> Ensure ordering between clearing the COMPUTING flag and checking
> IRQFACT, and between setting the IRQFACT flag and checking
> COMPUTING.  This ensures that no wakeups are lost.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


