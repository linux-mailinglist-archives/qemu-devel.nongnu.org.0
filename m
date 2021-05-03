Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FC03723A2
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 01:36:07 +0200 (CEST)
Received: from localhost ([::1]:53724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldi6g-0003HC-4q
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 19:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1ldhn8-0007mf-Ms
 for qemu-devel@nongnu.org; Mon, 03 May 2021 19:15:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1ldhmz-00083s-LF
 for qemu-devel@nongnu.org; Mon, 03 May 2021 19:15:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620083743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hzlCyT6fV3EjYc6AAUo/Cl+xom1ivD+SK7Vskn3zFQc=;
 b=KLsgmItpcdmIW7+rKkX23M+Y0ve12ft8YZz6cxMBO3cpXhpRn6b+OOxffswgVHSDwGG3Y5
 9cNcQiDwmwYd/wUgH6MrjOCWb0wwKB+dbjdD+j2q0xhxKRzpObUh67NcQ/7i3tk6SWZUWR
 Ep4JPgEPPQhiXfaENUszGcD+4nw5Euw=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-zYyCgb6tMb2K8zcn-IsmbQ-1; Mon, 03 May 2021 19:15:42 -0400
X-MC-Unique: zYyCgb6tMb2K8zcn-IsmbQ-1
Received: by mail-oi1-f198.google.com with SMTP id
 u132-20020aca478a0000b02901e5ac10ceebso2441200oia.11
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 16:15:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hzlCyT6fV3EjYc6AAUo/Cl+xom1ivD+SK7Vskn3zFQc=;
 b=jh9CvoA2y9sP9w959IyFtZjsz6fTzKlBv6G4zJ40ctM5RPcW2fYWLcTJkCeDJQfRUN
 ACMMS74ecx/Dx60Q2WnQ6roWZ2ziXhdKC6IFZG34aDW6OTZNuPURkOhwZsUHNcs6HfEl
 +ibzDJnMFfuLg3x0Idm3jsm3RNgpywj2CoLvdXVa68soBwzDe4+OOTSR4QjowFVnUW/K
 FLzEj4AfFneVYevOXgrp/5avTaCaUzGWTedaDcbjI+HKegBPVBOZjobVUeh4NJB956c5
 Nnv0nOXFOD8NDyGcGl/WQpENtFqWSkLbnUt9bHk1Lo+B/q27NLQWR+vPAAJopvtrg38D
 KEQg==
X-Gm-Message-State: AOAM532NAC+hIEaPaa01RG1ZqT88pCGlpGT3O6aMT+4FgQJaz+dtHVT+
 vkg4byLWm4UFvjENSwf6G82nJgvZNQHI7rxZ6Wofhzs+pT7/GAElxXAstDhO1EEsRU+dQTB9Qk4
 pMg11EOwN0FC2Row=
X-Received: by 2002:aca:3056:: with SMTP id w83mr760389oiw.154.1620083741747; 
 Mon, 03 May 2021 16:15:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqIEjuEMXn+VCiJrxkTe/64RRy3FnUORSPw4LYKpJL3FeqDuizkVe4DTz5oUmqlGE6QqoDOw==
X-Received: by 2002:aca:3056:: with SMTP id w83mr760375oiw.154.1620083741534; 
 Mon, 03 May 2021 16:15:41 -0700 (PDT)
Received: from [192.168.0.112] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 v19sm311960oic.21.2021.05.03.16.15.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 16:15:41 -0700 (PDT)
Subject: Re: [PATCH v2] Document qemu-img options data_file and data_file_raw
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210430133452.253102-1-ckuehl@redhat.com>
 <3f24af14-f324-1707-37b9-cbfc9bd082dd@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <b12175c4-db70-dc1e-6763-3124c1ad52ae@redhat.com>
Date: Mon, 3 May 2021 18:15:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <3f24af14-f324-1707-37b9-cbfc9bd082dd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/21 9:45 AM, Max Reitz wrote:
>> +  ``data_file_raw``
>> +    If this option is set to ``on``, QEMU will always keep the external
>> +    data file consistent as a standalone read-only raw image. It does
>> +    this by forwarding updates through to the raw image in addition to
>> +    updating the image metadata. If set to ``off``, QEMU will only
>> +    update the image metadata without forwarding the changes through
>> +    to the raw image. The default value is ``off``.
> 
> Hm, what updates and what changes?  I mean, the first part makes sense (the “It does this by...”), but the second part doesn’t.  qemu will still forward most writes to the data file.  (Not all, but most.)
> 
> (Also, nit pick: With data_file_raw=off, the data file is not a raw image.  (You still call it that in the penultimate sentence.))
> When you write data to a qcow2 file with data_file, the data also goes to the data_file, most of the time.  The exception is when it can be handled with a metadata update, i.e. when it's a zero write or discard.
> 
> In addition, such updates (i.e. zero writes, I presume) not happening to the data file are usually a minor problem.  The real problem is that without data_file_raw, data clusters can be allocated anywhere in the data file, whereas with data_file_raw, they are allocated at their respective guest offset (i.e. the host offset always equals the guest offset).
> 
> I personally would have been fine with the first sentence, but if we want more of an explanation...  Perhaps:
> 
> <<EOF
> 
> If this option is set to ``on``, QEMU will always keep the external data file consistent as a standalone read-only raw image.
> 
> It does this by effectively forwarding all write accesses that happen to the qcow2 file to the raw data file, including their offsets. Therefore, data that is visible on the qcow2 node (i.e., to the guest) at some offset is visible at the same offset in the raw data file.
> 
> If this option is ``off``, QEMU will use the data file just to store data in an effectively arbitrary manner.  The file’s content will not make sense without the accompanying qcow2 metadata.  Where data is written will have no relation to its offset as seen by the guest, and some writes (specifically zero writes) may not be forwarded to the data file at all, but will only be handled by modifying qcow2 metadata.
> 
> In short: With data_file_raw, the data file reads as a valid raw VM image file.  Without it, its content can only be interpreted by reading the accompanying qcow2 metadata.
> 
> Note that this option only makes the data file valid as a read-only raw image.  You should not write to it, as this may effectively corrupt the qcow2 metadata (for example, dirty bitmaps may become out of sync).
> 
> EOF
> 
> This got longer than I wanted it to be.  Hm.  Anyway, what do you think?

I found it very helpful. I'll incorporate your explanation into the next
revision.

I'm wondering what the most appropriate trailer would be for the next
revision?

	Suggested-by: Max [..]
	Co-developed-by: Max [..]

Let me know if you have a strong preference, otherwise I'll go with
Suggested-by:

Thank you,

Connor


