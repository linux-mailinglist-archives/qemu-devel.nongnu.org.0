Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8AB6EA428
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 08:56:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppkgl-00025f-T6; Fri, 21 Apr 2023 02:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1ppkgj-00025S-Mh
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:56:09 -0400
Received: from [122.171.17.216]
 (helo=li-1901474c-32f3-11b2-a85c-fc5ff2c001f3.ibm.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1ppkgh-0000tr-1H
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:56:08 -0400
Received: from root by li-1901474c-32f3-11b2-a85c-fc5ff2c001f3.ibm.com with
 local (Exim 4.96) (envelope-from <harshpb@linux.ibm.com>)
 id 1ppkgJ-000sWZ-1d; Fri, 21 Apr 2023 12:25:43 +0530
Date: Fri, 21 Apr 2023 12:25:43 +0530
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>
Cc: qemu-devel@nongnu.org
Message-ID: <6442336f774e3_332682ac3cf5725c019@li-1901474c-32f3-11b2-a85c-fc5ff2c001f3.ibm.com.notmuch>
In-Reply-To: <ZEIvI/eSTdEKJLmL@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230421042322.684093-1-kconsul@linux.vnet.ibm.com>
 <20230421042322.684093-2-kconsul@linux.vnet.ibm.com>
 <ZEIvI/eSTdEKJLmL@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
Subject: Re: [PATCH v4 1/2] avocado_qemu/__init__.py: factor out the qemu-img
 finding
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 122.171.17.216 (failed)
Received-SPF: softfail client-ip=122.171.17.216;
 envelope-from=harshpb@linux.ibm.com;
 helo=li-1901474c-32f3-11b2-a85c-fc5ff2c001f3.ibm.com
X-Spam_score_int: 48
X-Spam_score: 4.8
X-Spam_bar: ++++
X-Spam_report: (4.8 / 5.0 requ) BAYES_00=-1.9, HELO_DYNAMIC_IPADDR=1.951,
 RCVD_IN_PBL=3.335, RCVD_IN_SORBS_DUL=0.001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Kautuk Consul wrote:
> Adding Harsh Prateek Bora.
> 
> On 2023-04-20 23:23:21, Kautuk Consul wrote:
> > Factor out the code that finds the qemu-img binary in the
> > QemuSystemTest class and create a new get_qemu_img() function
> > with it. This function will get called also from the new code
> > in tuxrun_baselines.py avocado test-case.
> > 
> > Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> > ---
> >  tests/avocado/avocado_qemu/__init__.py | 27 +++++++++++++++-----------
> >  1 file changed, 16 insertions(+), 11 deletions(-)
> > 
> > diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
> > index cb71f50db9..d8f390e27a 100644
> > --- a/tests/avocado/avocado_qemu/__init__.py
> > +++ b/tests/avocado/avocado_qemu/__init__.py
> > @@ -330,6 +330,19 @@ def _new_vm(self, name, *args):
> >              vm.add_args(*args)
> >          return vm
> >  
> > +    def get_qemu_img(self):
> > +        self.log.debug('Looking for and selecting a qemu-img binary')
> > +
> > +        # If qemu-img has been built, use it, otherwise the system wide one
> > +        # will be used.
> > +        qemu_img = os.path.join(BUILD_DIR, 'qemu-img')
> > +        if not os.path.exists(qemu_img):
> > +            qemu_img = find_command('qemu-img', False)
> > +        if qemu_img is False:
> > +            self.cancel('Could not find "qemu-img"')
> > +
> > +        return qemu_img
> > +
> >      @property
> >      def vm(self):
> >          return self.get_vm(name='default')
> > @@ -594,17 +607,9 @@ def set_up_existing_ssh_keys(self):
> >          return (ssh_public_key, ssh_private_key)
> >  
> >      def download_boot(self):
> > -        self.log.debug('Looking for and selecting a qemu-img binary to be '
> > -                       'used to create the bootable snapshot image')
> > -        # If qemu-img has been built, use it, otherwise the system wide one
> > -        # will be used.  If none is available, the test will cancel.
> > -        qemu_img = os.path.join(BUILD_DIR, 'qemu-img')
> > -        if not os.path.exists(qemu_img):
> > -            qemu_img = find_command('qemu-img', False)
> > -        if qemu_img is False:
> > -            self.cancel('Could not find "qemu-img", which is required to '
> > -                        'create the bootable image')
> > -        vmimage.QEMU_IMG = qemu_img
> > +        # Set the qemu-img binary.
> > +        # If none is available, the test will cancel.
> > +        vmimage.QEMU_IMG = super().get_qemu_img()
> > 
Reviewed-by: Harsh Prateek Bora <harshpb@linux.ibm.com>

> >          self.log.info('Downloading/preparing boot image')
> >          # Fedora 31 only provides ppc64le images
> > -- 
> > 2.25.1
> > 
> > 
> 



