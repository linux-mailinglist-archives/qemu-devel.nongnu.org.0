Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8676376BFB
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 00:02:45 +0200 (CEST)
Received: from localhost ([::1]:43466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf8YW-0007qy-CA
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 18:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lf8WU-0007Ac-1s
 for qemu-devel@nongnu.org; Fri, 07 May 2021 18:00:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lf8WP-0007vT-El
 for qemu-devel@nongnu.org; Fri, 07 May 2021 18:00:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620424830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+2l+yILKTmVXAtWg5GIkfQ0owvNFPiGBYpccXtbsjOg=;
 b=H4vJEKy68g9nRxQqdZHm2mI+wpBKUJaR/0NyYRypDeWjJhheDvr7N7q/CVYqgcLep1aVbM
 kg+RuNcM5qTZsHHTDc/8UcZdolBNYoDrsspGlvPu/uPtRjk8Zg+rsm4pZC5EWwsTi9mRlT
 UeDJsYaE9OEftVG6xa8p+Xq/+GIYzBI=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-T8IATwL0OyWZlfYy036s5w-1; Fri, 07 May 2021 18:00:29 -0400
X-MC-Unique: T8IATwL0OyWZlfYy036s5w-1
Received: by mail-oi1-f200.google.com with SMTP id
 w4-20020a0568081404b0290102a1fd05b2so5064145oiv.6
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 15:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+2l+yILKTmVXAtWg5GIkfQ0owvNFPiGBYpccXtbsjOg=;
 b=jMVdi9dThSL9IzQqPDZfu5Nv4fqUw6jUe+e1R/1cZQfIwpO605ka6ekGAOJMMuijcs
 XAu5bgUENbNheAU6aciYx4YUdZ3uXY4/cnKJRZlToaweWJ3DJuQeMQiNJFH9fx3riqXi
 wKLN3uDc3Fot5yfaN8PFD+N/Qy3t1sk9vrShXOe/+lpyVFT5Kgpld50bbvN0d1CYomvf
 Co8lbbGdRME4GufMnCRcAkoFco7eY3iCsytTJ5gF6dMpRkaIlAGITFYw5cR6dn8Kxgaq
 cNkq7a9j3j5vcMN+G3vbBjjQ5E+OEEFrFnsZ11ls3HSxqYwZ4xcZ1mdl19kv0ntFbDWp
 S8mQ==
X-Gm-Message-State: AOAM532vqs6e8UJ5jX/5KhgDl0lAVmEOc7gU+b+ovPcU7rKjqiJjFSE3
 6sVq7OPV11oUP7/hrgfIxs/eIxeKxA9gzrAlO4Mhaw/1kRXyFtKcyw2FBtRWkHhdn/mer4S82gZ
 R5oazPJxLOgyl99o=
X-Received: by 2002:a05:6830:410e:: with SMTP id
 w14mr10347937ott.251.1620424828751; 
 Fri, 07 May 2021 15:00:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwHJq/Lo10V2TsKqgNvfJloU+un87SEsPkv1RYQNIPii+V71dQ/VupeZR7Yxt1L26nTBGZag==
X-Received: by 2002:a05:6830:410e:: with SMTP id
 w14mr10347923ott.251.1620424828531; 
 Fri, 07 May 2021 15:00:28 -0700 (PDT)
Received: from [192.168.0.112] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 q26sm1509837otn.0.2021.05.07.15.00.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 15:00:28 -0700 (PDT)
Subject: Re: [PATCH v3] target/i386/sev: add support to query the attestation
 report
To: Brijesh Singh <brijesh.singh@amd.com>, qemu-devel@nongnu.org
References: <20210429170728.24322-1-brijesh.singh@amd.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <dd711e32-c4bb-ca8f-5892-0133098e632e@redhat.com>
Date: Fri, 7 May 2021 17:00:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210429170728.24322-1-brijesh.singh@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Tom Lendacky <Thomas.Lendacky@amd.com>, kvm@vger.kernel.org,
 James Bottomley <jejb@linux.ibm.com>, armbru@redhat.com, dgilbert@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/21 12:07 PM, Brijesh Singh wrote:
> The SEV FW >= 0.23 added a new command that can be used to query the
> attestation report containing the SHA-256 digest of the guest memory
> and VMSA encrypted with the LAUNCH_UPDATE and sign it with the PEK.
> 
> Note, we already have a command (LAUNCH_MEASURE) that can be used to
> query the SHA-256 digest of the guest memory encrypted through the
> LAUNCH_UPDATE. The main difference between previous and this command
> is that the report is signed with the PEK and unlike the LAUNCH_MEASURE
> command the ATTESATION_REPORT command can be called while the guest

typo: 'ATTESATION_REPORT'

> is running.
> 
> Add a QMP interface "query-sev-attestation-report" that can be used
> to get the report encoded in base64.
> 
> Cc: James Bottomley <jejb@linux.ibm.com>
> Cc: Tom Lendacky <Thomas.Lendacky@amd.com>
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: kvm@vger.kernel.org
> Reviewed-by: James Bottomley <jejb@linux.ibm.com>
> Tested-by: James Bottomley <jejb@linux.ibm.com>
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>

Looks good to me!

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>


