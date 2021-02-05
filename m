Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 455953109B8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 12:00:45 +0100 (CET)
Received: from localhost ([::1]:41190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7yqw-0007Zn-HX
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 06:00:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l7you-0006wN-6x
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 05:58:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l7yos-0001nc-LT
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 05:58:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612522713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZNtrDZzHl06xAB6Q1H6MEmrOKdAJ8o4m/JQqIbGB/cg=;
 b=VIceKk1ZQJHbcpBGfJR21xrOArfluj+5YRj4Q85zxAOQ20PqlxDJc7wmYs8NPwoTwssUYr
 J8IOFtpyhgkN5vJMNzePWZcmExwFrlhd1KTCBl3oqcRw/BnFBMmljvwMf/axcnYbERJmcU
 D3r57PHkkejxb9H+hj/qUszx0AcsESA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-EVb2EhERMheTPRUHisZmNQ-1; Fri, 05 Feb 2021 05:58:30 -0500
X-MC-Unique: EVb2EhERMheTPRUHisZmNQ-1
Received: by mail-ej1-f69.google.com with SMTP id by20so6563299ejc.1
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 02:58:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZNtrDZzHl06xAB6Q1H6MEmrOKdAJ8o4m/JQqIbGB/cg=;
 b=Q2J340lOi5ZpcWSzmdhAw30SmjScnDkx+PBnQFVWAUBxQfxV7DlnZEOJfwoOcvri+0
 EzaUVPP6/Jmz6NCXjWyho6I/jRv6XWDcudPsLChtvpfLM0P1VXnz+Vjbi1G79vVxp0jl
 R0jJoSXv+xZ+eDKc2Y1eqPUxWTLY5nXIVvhVSJc39kE4HIOzP9zu3c6EtZLnnfc/C9wd
 /VwpZXdFXfPHfkDQOI6lhaQjpmIQjvoPe2zfMbZ1nj+u30SinODzGXKQWMpiT64WSsn/
 NbBYMdeLZedUTJfAJvjGbyNA67OmiNuJH/b1LXPrjNjcnyeaagDF3Qi/Ro9paslqeAoO
 rUEg==
X-Gm-Message-State: AOAM530/i39mY9MhkBLwECgcxW7O99XKFcm5I6gbYAGM0QhM8BpM9lxs
 nK3v936H5kPGO615MtcE9ZCTBfSdwvv7xgZbDxq0y1ZBbWE0VEb8mIiOKJeyEj/OEkXqPob0yHr
 az7UyfPwJd5KXmL8=
X-Received: by 2002:a17:907:7347:: with SMTP id
 dq7mr3577312ejc.385.1612522708924; 
 Fri, 05 Feb 2021 02:58:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDNBXi4vmMGYUrevitPiDiVfAB69m1bLhPNNxHEYdh94hOA17HO8AWDMEBylQ1WFrGC4tjtg==
X-Received: by 2002:a17:907:7347:: with SMTP id
 dq7mr3577295ejc.385.1612522708769; 
 Fri, 05 Feb 2021 02:58:28 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x14sm3738122ejb.0.2021.02.05.02.58.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 02:58:27 -0800 (PST)
Subject: Re: [PATCH v3 2/2] sev: update sev-inject-launch-secret to make gpa
 optional
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>
References: <20210204193939.16617-1-jejb@linux.ibm.com>
 <20210204193939.16617-3-jejb@linux.ibm.com>
 <20210205095115.GB908621@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e11240d0-d325-336b-f43b-3cee6cf94b76@redhat.com>
Date: Fri, 5 Feb 2021 11:58:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210205095115.GB908621@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: thomas.lendacky@amd.com, ashish.kalra@amd.com, brijesh.singh@amd.com,
 david.kaplan@amd.com, jon.grimm@amd.com, tobin@ibm.com, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, frankeh@us.ibm.com,
 Dov.Murik1@il.ibm.com, dovmurik@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/02/21 10:51, Daniel P. Berrangé wrote:
>> +        if (!pc_system_ovmf_table_find(SEV_SECRET_GUID, &data, NULL)) {
>> +            error_setg(errp, "SEV: no secret area found in OVMF,"
>> +                       " gpa must be specified.");
>> +            return;
>> +        }
> IIUC, historically QEMU has gone out of its way to avoid creating a
> direct dependancy on specific firmware implementation details such
> as this, so this whole approach makes me feel really uneasy.

The problem here is that this secret must be measured and therefore 
cannot be extracted by the guest out of fw_cfg.  Note that there's no 
reason why other firmware than OVMF could not adopt the same interface.

Paolo


