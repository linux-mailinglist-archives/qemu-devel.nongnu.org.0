Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 868C02B50F6
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 20:24:12 +0100 (CET)
Received: from localhost ([::1]:56776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kek6l-00054i-Hj
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 14:24:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kejh6-0000IL-2z
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:57:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kejh2-0006Yw-VF
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:57:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605553054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Osww4pJsnotjCP/AjvyUSr79Y56uAyDt3SRlLAvWx/0=;
 b=cOyzAEYbRPtH8w5EHZFlClO/HxIaY6MQLsxfB02EYOfPd8SheYvOZKLyAIdFz3nTc7XcG+
 jOd5UQ8KRO3WjyRcmpn17WUh2DSJC8dsD/O1bqvMjbCCqmk9jQDftsy8yIZrIMJAx/URHw
 rcvW7CCBGcI1H5bLpLu0Tlrs+lp+36w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-67T4JepCNzmP9KkQnWNNhg-1; Mon, 16 Nov 2020 13:57:32 -0500
X-MC-Unique: 67T4JepCNzmP9KkQnWNNhg-1
Received: by mail-wm1-f69.google.com with SMTP id a134so98453wmd.8
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 10:57:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Osww4pJsnotjCP/AjvyUSr79Y56uAyDt3SRlLAvWx/0=;
 b=OQ882Kjwtvr3RUjbWA703mt1oYL1PPn030aG+12OJMTVcwYNPM20JPSvafViNBHWWd
 CgmtOqJpZW3Vf8LXGIBytkBaVs8GGTQUur+SYbb826NTvB9yVyghhB7/b3Xucja/5EPn
 jaI0tKfMZs89q26vVlg+vSv5xhxsL6kqVSaWahIgCBIROVMOephAj8r6H/orYm5yRbjl
 jaN5MBzfP3cOoB7GMDEnMtdAYVyUxhoHDXBkOZUlQof24t7VSbcC9Oz6CCNniJOplyF8
 OcRtzoiEEbe0NuwRd078XO2+2M5uk9TTDbnemZHdUeI077CkzMq9aa3WJRCuHAxMYmWl
 pg0w==
X-Gm-Message-State: AOAM530byKlYugvfWiReD8ljjojsANYfbBiT2kLE6zqQp4c/S+d9UMIH
 m8LW46XPhdjppCtewMVY43pA7HJDI1iuMAVKBsvrgUID2R+LxDr9j1Eaqil9799FDYOjFAS4b2x
 GGCvL5htfsqGq/kikheHZaG7i3KBwwvKJMDV9C/5GAr6FkyUxc4+nciK3jPNR+TVkfqk=
X-Received: by 2002:adf:9144:: with SMTP id j62mr4189172wrj.419.1605553050954; 
 Mon, 16 Nov 2020 10:57:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFYqs3cAhKs2eSFVPyXOAwxG8axxqIQluuCRbMwAHNs1gggSb/UiGnA2pK5mE5nJZg7pECKg==
X-Received: by 2002:adf:9144:: with SMTP id j62mr4189159wrj.419.1605553050778; 
 Mon, 16 Nov 2020 10:57:30 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o184sm226551wmo.37.2020.11.16.10.57.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 10:57:30 -0800 (PST)
Subject: Re: [PATCH 5/7] scsi: Add mapping for generic SCSI_HOST status to
 sense codes
To: Hannes Reinecke <hare@suse.de>
References: <20201116184041.60465-1-hare@suse.de>
 <20201116184041.60465-6-hare@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <07739b7b-2087-0279-8f4b-6c909079cf48@redhat.com>
Date: Mon, 16 Nov 2020 19:57:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116184041.60465-6-hare@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/11/20 19:40, Hannes Reinecke wrote:
> +        case SCSI_HOST_TARGET_FAILURE:
> +            *sense = SENSE_CODE(TARGET_FAILURE);
> +            return CHECK_CONDITION;
> +        case SCSI_HOST_RESERVATION_ERROR:
> +            return RESERVATION_CONFLICT;
> +        case SCSI_HOST_ALLOCATION_FAILURE:
> +            *sense = SENSE_CODE(SPACE_ALLOC_FAILED);
> +            return CHECK_CONDITION;
> +        case SCSI_HOST_MEDIUM_ERROR:
> +            *sense = SENSE_CODE(READ_ERROR);
> +            return CHECK_CONDITION;

Can these actually be visible to userspace?  I'd rather avoid having 
them in QEMU if possible.

Otherwise, the patches are completely sensible.

Paolo


