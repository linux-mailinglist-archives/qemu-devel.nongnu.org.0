Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B00C845CA30
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 17:37:13 +0100 (CET)
Received: from localhost ([::1]:44900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpvGi-0003Bm-7l
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 11:37:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tfanelli@redhat.com>)
 id 1mpvE2-00026X-Ex
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 11:34:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tfanelli@redhat.com>)
 id 1mpvDy-0001SI-A1
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 11:34:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637771659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sU+GlI3MjF1xXlR++T++XzD4WRs17PnRG2J6DO5OWVY=;
 b=hCIz95sRXGcFemXynnu/OTnUv+JgOrDu7WRXzKG/5v2O/x5zsQQFUqOQcqRskgfaEHIdpD
 dSycP5PToYpvJQ7LSsu7e7ZX0tOexoVzD+vq7/ldpxcG1DRdupJWA6/MwxjqpdRjnHfaGV
 j+69bpPrmtqzbOZj/4ZvcBa+EUxZ/WE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-zU2PJ8OBP-Sl3ZjbnV_0MQ-1; Wed, 24 Nov 2021 11:34:18 -0500
X-MC-Unique: zU2PJ8OBP-Sl3ZjbnV_0MQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 kc26-20020a056214411a00b003cabea18f69so876064qvb.19
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 08:34:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=sU+GlI3MjF1xXlR++T++XzD4WRs17PnRG2J6DO5OWVY=;
 b=Xjyz0ROoxrTVCjyXVbbnluZxiwxHrckd9uZcKryJD4dImxvMHbn4+60opy68OZHd17
 shwpjOEUkKYFKYvjQ5qrNTBWIsb7mT8mqcLR0LjMBDBKmyEjE2rNJ134rgZAsSAkK0nB
 VWz17F1m6FijigYsiqrs6BBWRJhphQT/YXcMtXCyTMOQ0toGwUNWGaFz+6PdqxUGXLSM
 N8VTZyQltqZ9/wGaHXnwPCN5SOcwg3gAlhPVvxNAWVbS7S2+byfhjjPUGZ0mlEVekHBX
 ls600RGBU4y9igg/Mf2rku9J6I2d4b3YIy3B0dPZHL3CvSe1mLOCX8D3BQhjdgFeYuRA
 +fwg==
X-Gm-Message-State: AOAM5337gy34Vfc0RFydEC+GuYBwIwACIeqi0HtCxdAORtDb6nKFyOKA
 /B01rbW9iqED4gd41wZ31Cu097lkppH6mL+UIX3D1nBKfWtToPTlJiXL+TmYlnHwbnFZ1o3vsw6
 y4xCCdac5LoiDGqTW/XuZYoRTOm5UZcrRNUu2fGk/Vqj1lAwyFDbRAx87IMBnlujC8AA=
X-Received: by 2002:a05:622a:53:: with SMTP id
 y19mr8949356qtw.96.1637771657715; 
 Wed, 24 Nov 2021 08:34:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwuPtOwj8oKSIKA8DWTxTsEWpAx2ErUBU3J/nVIMj/AZYGXTZTyqS3rP+QaYFZL+RFRr+YwXQ==
X-Received: by 2002:a05:622a:53:: with SMTP id
 y19mr8949324qtw.96.1637771657460; 
 Wed, 24 Nov 2021 08:34:17 -0800 (PST)
Received: from [192.168.1.234] (pool-71-175-3-221.phlapa.fios.verizon.net.
 [71.175.3.221])
 by smtp.gmail.com with ESMTPSA id br43sm101383qkb.57.2021.11.24.08.34.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 08:34:17 -0800 (PST)
Message-ID: <8b0c6f36-8a11-eeff-8bab-68c47fe95fbe@redhat.com>
Date: Wed, 24 Nov 2021 11:34:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
To: qemu-devel@nongnu.org
From: Tyler Fanelli <tfanelli@redhat.com>
Subject: SEV guest attestation
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=tfanelli@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=tfanelli@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John Ferlan <jferlan@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

We recently discussed a way for remote SEV guest attestation through 
QEMU. My initial approach was to get data needed for attestation through 
different QMP commands (all of which are already available, so no 
changes required there), deriving hashes and certificate data; and 
collecting all of this into a new QMP struct (SevLaunchStart, which 
would include the VM's policy, secret, and GPA) which would need to be 
upstreamed into QEMU. Once this is provided, QEMU would then need to 
have support for attestation before a VM is started. Upon speaking to 
Dave about this proposal, he mentioned that this may not be the best 
approach, as some situations would render the attestation unavailable, 
such as the instance where a VM is running in a cloud, and a guest owner 
would like to perform attestation via QMP (a likely scenario), yet a 
cloud provider cannot simply let anyone pass arbitrary QMP commands, as 
this could be an issue.

So I ask, does anyone involved in QEMU's SEV implementation have any 
input on a quality way to perform guest attestation? If so, I'd be 
interested. Thanks.


Tyler.

-- 
Tyler Fanelli (tfanelli)


