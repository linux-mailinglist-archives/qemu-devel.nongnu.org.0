Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD2A332880
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 15:24:41 +0100 (CET)
Received: from localhost ([::1]:60094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJdHs-0008ME-DQ
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 09:24:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJdFz-0006az-1N
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:22:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJdFw-0003wt-IR
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:22:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615299759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5dMbHVJpy+cO5ZJ4Pv9wAwDQaU/VeyJYr3PcB0+jSzg=;
 b=FzdaaVDgLB+hZ39RFS3GwEg0wv3rAo5nHwYP9v+AbOmQgQg6BM2LbGxyhGLIpdbkQe6Rej
 4foJe1g04+njqSk8KhU5DCk46ZdmN/8x2Y7+bWxDcVKepPwAZ8rYrSIuleiVm0mENw6qcp
 kzYXMeF4xujB1xx4WW3ySq3oRWTClrw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-gxY6zJZKOvWn-s_t5sX6-Q-1; Tue, 09 Mar 2021 09:22:37 -0500
X-MC-Unique: gxY6zJZKOvWn-s_t5sX6-Q-1
Received: by mail-wr1-f69.google.com with SMTP id f3so6490702wrt.14
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:22:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5dMbHVJpy+cO5ZJ4Pv9wAwDQaU/VeyJYr3PcB0+jSzg=;
 b=UU9C3T17m3LrtVWYPCTubURjwFwxhZBzOX55wvvCfsyLzqHJrrZewAuaGZ7tcqSaWJ
 m9IhyywVW/DZ16mJe8LFMwZP0r8gUVOOkn+vf9Hg0cAXtf6msRORBJkuo2hpNHtawHzZ
 KBQFq6GIl8ssfmDIQBBXqyl4BXhjEZvZpGeqOqWqW7hHc+lYPG41f0zOtNdP5Uel0I5E
 vSPA7wBcKgxK/zQQC6vRGwEgJw2TLTh1KGz4IQ/AGfbKHaYMdOx8iz+fasY9usf3Qiho
 iSoZE7dc46IzgfuDpoE1b4588V0BajeTwr0LWl035mW6HaGzFyqONuZxsM813yLnd/yl
 L6FQ==
X-Gm-Message-State: AOAM532N1ZiqyGqNCzhMreJUEM1DXal3B6UKrCVqwb9ijheTSBfFBgfK
 xrZuCIFrmMeP1sH/YqQo+h0EXTi9Pmh/EgfFY9dDvOsU9tcjYXKQehHCbGtPlH3+TwPmrwfVEe7
 5lRhY24hnYBdAeak=
X-Received: by 2002:adf:ea0e:: with SMTP id q14mr29098113wrm.389.1615299756447; 
 Tue, 09 Mar 2021 06:22:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxf14t72eKrzfO1Lrd5ptVt3fVSW6PEFO+/SKsxavaHSvmVvNtXRzVtJoecaGqR3UCZzDRf4g==
X-Received: by 2002:adf:ea0e:: with SMTP id q14mr29098103wrm.389.1615299756293; 
 Tue, 09 Mar 2021 06:22:36 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t8sm25771119wrr.10.2021.03.09.06.22.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 06:22:35 -0800 (PST)
Subject: Re: [PATCH] scsi: fix sense code for EREMOTEIO
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210309135752.187916-1-pbonzini@redhat.com>
 <369adbbf-5ec4-2e1a-2df1-f9277123ac3f@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <34591ce5-0470-3eb2-3138-f57ad51905db@redhat.com>
Date: Tue, 9 Mar 2021 15:22:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <369adbbf-5ec4-2e1a-2df1-f9277123ac3f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/03/21 15:14, Philippe Mathieu-Daudé wrote:
>> SENSE_CODE(LUN_COMM_FAILURE) has an ABORTED COMMAND sense key,
>> so it results in a retry in Linux.  To ensure that EREMOTEIO
>> is forwarded to the guest, use a HARDWARE ERROR sense key
>> instead.  Note that the code before commit d7a84021d was incorrect
>> because it used HARDWARE_ERROR as a SCSI status, not as a sense
>> key.
> 
> It is not clear whether if it deserves a 'Fixes: d7a84021db8 ("scsi:
> introduce scsi_sense_from_errno()")' or not...

Yes, why not.  That was in turn a bugfix but not the best.

Paolo

>> Reported-by: Marc-André Lureau<marcandre.lureau@redhat.com>
>> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> 


