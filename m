Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ABA3156B8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 20:26:49 +0100 (CET)
Received: from localhost ([::1]:33806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Yeu-0005iS-Fa
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 14:26:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yamahata.qemudev@gmail.com>)
 id 1l9YbW-0003lW-KM
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:23:18 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:42215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yamahata.qemudev@gmail.com>)
 id 1l9YbU-0007Fn-RD
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:23:18 -0500
Received: by mail-pf1-x431.google.com with SMTP id w18so12517322pfu.9
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 11:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WY040tlX3HjZ3O0s7/IW4T7O1s0Mp7iroHNDokX1jR8=;
 b=n9rK1PLt3F5xr74VIh74tvRSpW9DQ43vSc8SNW8+9NDKp005L13AEY55RuwT7YOwrX
 CI6xZvk5K9Hc3MineJqjkqEBhEmsJzcwxFqz4bN+0Tu3wqly6rUO71eO1jDinHXyPNfq
 nHqkELW1eKQ1yqW672t+e2XEU1hJCOhH5UyNytZFpqzmTzo5kDHqY+Q//H7URFO1jTFE
 v55aXR8phf8GibOWnM1tPaEGhtPlFr+25SRWH2LYcy2kPZhxNBVcMTkH/c24AqTN02Ex
 KsRQNTOV8DVUVhLg4lBesF/LNGkdcUBXrkXY8GJLxY1kZGYcO52/Cefh1/+lJWJCIHvS
 UgnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WY040tlX3HjZ3O0s7/IW4T7O1s0Mp7iroHNDokX1jR8=;
 b=IHha7KOoehqLz0mWZP7R9RjAap6Uq3ewYZ4fFq+9OGS42r+kHegZJ66QnMgV+72G8C
 7Lwg/6esh29vkt/NXcA2VzUXSZPAEIKt46HP89diYzPOVKSWw6HIaawvmPV4iebGUPD1
 Z8UOROGm6yTNkeLHdlVFQBMzEixzC1N4mTTR7/u4EQyObWBIBulkFiHWR0aKLN7HNAFs
 m6SyiA2rRsZIKuvcfyOlNS0QcGxeiauerWnEWaKIN1P7PTxpwlRB5qIsZXmBHqyQg3kU
 7yKG/kCeyq3LhzucQgY4bjO5c4dSuCq9v2l0xlCr/P0zMO3Nzaz+jFmygXtm2eW/Okad
 IZwA==
X-Gm-Message-State: AOAM5329CWhTGRr5mVWv50fQlJ/PBFLrpdgAjpsWZGAM3fxtjRl9H6hL
 T2mj+feeIBUZzPQgNIBeOfQ=
X-Google-Smtp-Source: ABdhPJwyEvOT0N3PMzw/tExwaHXrKP9DFTATTip4f2rnOKJoJE/J8opardzb5AtJKmiN6yJEev1Fwg==
X-Received: by 2002:a63:1f45:: with SMTP id q5mr23046708pgm.414.1612898594859; 
 Tue, 09 Feb 2021 11:23:14 -0800 (PST)
Received: from localhost ([2601:647:4600:11e1:d2fd:ba5d:619c:c25d])
 by smtp.gmail.com with ESMTPSA id q196sm11303492pfc.162.2021.02.09.11.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 11:23:14 -0800 (PST)
From: Isaku Yamahata <yamahata.qemudev@gmail.com>
X-Google-Original-From: Isaku Yamahata <isaku.yamahata@gmail.com>
Date: Tue, 9 Feb 2021 11:23:05 -0800
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2 3/9] acpi/core: always set SCI_EN when SMM isn't
 supported
Message-ID: <20210209192305.GA28049@private.email.ne.jp>
References: <cover.1612821108.git.isaku.yamahata@intel.com>
 <b21a1b211ad4dc99aaf5f19d803f96dfa88b3fb1.1612821109.git.isaku.yamahata@intel.com>
 <20210209160514.0e015448@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210209160514.0e015448@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=yamahata.qemudev@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>, philmd@redhat.com,
 qemu-devel@nongnu.org, isaku.yamahata@gmail.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 09, 2021 at 04:05:14PM +0100,
Igor Mammedov <imammedo@redhat.com> wrote:

> On Mon,  8 Feb 2021 13:57:22 -0800
> isaku.yamahata@gmail.com wrote:
> 
> > From: Isaku Yamahata <isaku.yamahata@intel.com>
> > 
> > If SMM is not supported, ACPI fixed hardware doesn't support
> > legacy-mode. ACPI-only platform. Where SCI_EN in PM1_CNT register is
> > always set.
> > The bit tells OS legacy mode(SCI_EN cleared) or ACPI mode(SCI_EN set).
> 
> does it break some specific software?

With the next patch (setting fadt.smi_cmd = 0 when smm isn't supported),
guest Linux tries to switch to ACPI mode, finds smi_cmd = 0, and then
fails to initialize acpi subsystem.
will update the commit message in next respin.


> > ACPI spec 4.8.10.1 PM1 Event Grouping
> > PM1 Eanble Registers
> > > For ACPI-only platforms (where SCI_EN is always set)  
> > 
> > Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> it changes guest ABI for old machine types but it seems to me that
> it's harmless (in typical use-cases backward and forward migrated
> guest should work fine).
> 
> The only thing that is broken is transitioning to legacy mode
> when guest was started on old QEMU and then migrated to the new one
> where disable op will be NOP and qemu always stays in ACPI mode
> (so guest will hang while it waits for transition to happen).

The patch affects guests only when SMM isn't supported.
Concretely
- user explicitly specified to disable smm by -machine smm=off
or
- underlying kvm doesn't have KVM_CAP_X86_SMM (smm=auto: default)
Please refer to x86_machine_is_smm_enabled().
Also Libvirt checks if guest bios requires SMI and enables smm even
when user disabling SMM. qemuFirmwareEnableFeatures()

If smm is disabled and legacy-mode is enabled without this patch,
SMI won't be injected to guest anyway. Thus guest breaks already.


> Can you test this scenario with various guest OSes (old/new/MS Windows)
> to check if it won't break them.

Unless -machine smm=off is explicitly passed, this patch won't break
guests. And such case is rare as I described above.
My motivation for this patch series is preparation for TDX which disallows
SMM mode and SMI injection.


> if we are to be conservative, we need to disable this compliance fix
> on old machine types.

I'm fine with adding one more knob to be on safe side.
-machine smm=off is such knob, though.

Thanks,
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

